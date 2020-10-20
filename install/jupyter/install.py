import argparse
import json
import os
import sys

from jupyter_client.kernelspec import KernelSpecManager

ALIASES = {
    "ISYSML_LIBRARY_PATH": {
    },
    "ISYSML_API_BASE_PATH": {
    },
    "ISYSML_GRAPHVIZ_PATH": {
    },
    
}

NAME_MAP = {
    "library-path": "ISYSML_LIBRARY_PATH",
    "api-base-path": "ISYSML_API_BASE_PATH",
    "graphviz-path": "ISYSML_GRAPHVIZ_PATH",
    
}

def type_assertion(name, type_fn):
    env = NAME_MAP[name]
    aliases = ALIASES.get(env, {})

    def checker(value):
        alias = aliases.get(value, value)
        type_fn(alias)
        return alias
    setattr(checker, '__name__', getattr(type_fn, '__name__', 'type_fn'))
    return checker

class EnvVar(argparse.Action):
    def __init__(self, option_strings, dest, aliases=None, name_map=None, list_sep=None, **kwargs):
        super(EnvVar, self).__init__(option_strings, dest, **kwargs)

        if aliases is None: aliases = {}
        if name_map is None: name_map = {}

        self.aliases = aliases
        self.name_map = name_map
        self.list_sep = list_sep

        for name in self.option_strings:
            if name.lstrip('-') not in name_map:
                raise ValueError('Name "%s" is not mapped to an environment variable' % name.lstrip('-'))


    def __call__(self, parser, namespace, value, option_string=None):
        if option_string is None:
            raise ValueError('option_string is required')

        env = getattr(namespace, self.dest, None)
        if env is None:
            env = {}

        name = option_string.lstrip('-')
        env_var = self.name_map[name]

        if self.list_sep:
            old = env.get(env_var)
            value = old + self.list_sep + str(value) if old is not None else str(value)

        env[env_var] = value

        setattr(namespace, self.dest, env)

if __name__ == '__main__':
    parser = argparse.ArgumentParser(description='Install the sysml kernel.')

    install_location = parser.add_mutually_exclusive_group()
    install_location.add_argument(
        '--user',
        help='Install to the per-user kernel registry.',
        action='store_true'
    )
    install_location.add_argument(
        '--sys-prefix',
        help="Install to Python's sys.prefix. Useful in conda/virtual environments.",
        action='store_true'
    )
    install_location.add_argument(
        '--prefix',
        help='''
        Specify a prefix to install to, e.g. an env.
        The kernelspec will be installed in PREFIX/share/jupyter/kernels/
        ''',
        default=''
    )

    parser.add_argument(
        '--replace',
        help='Replace any existing kernel spec with this name.',
        action='store_true'
    )

    parser.add_argument(
        "--library-path",
        dest="env",
        action=EnvVar,
        aliases=ALIASES,
        name_map=NAME_MAP,
        help="A file path separator delimited list of library path entries that should be available to the user code. **Important:** no matter what OS, this should use forward slash \"/\" as the file separator.",
        type=type_assertion("library-path", str),
        list_sep=os.pathsep,
    )
    parser.add_argument(
        "--api-base-path",
        dest="env",
        action=EnvVar,
        aliases=ALIASES,
        name_map=NAME_MAP,
        help="The base path for the API that the model is published to using the %publish magic command.",
        type=type_assertion("api-base-path", str),
    )
    parser.add_argument(
        "--graphviz-path",
        dest="env",
        action=EnvVar,
        aliases=ALIASES,
        name_map=NAME_MAP,
        help="The path to the Graphviz dot executable that is used for the %viz magic command.",
        type=type_assertion("graphviz-path", str),
    )
    

    args = parser.parse_args()

    if not hasattr(args, "env") or getattr(args, "env") is None:
        setattr(args, "env", {})
    

    # Install the kernel
    install_dest = KernelSpecManager().install_kernel_spec(
        os.path.join(os.path.dirname(os.path.abspath(__file__)), 'sysml'),
        kernel_name='sysml',
        user=args.user,
        prefix=sys.prefix if args.sys_prefix else args.prefix,
        replace=args.replace
    )

    # Connect the self referencing token left in the kernel.json to point to it's install location.

    # Prepare the token replacement string which should be properly escaped for use in a JSON string
    # The [1:-1] trims the first and last " json.dumps adds for strings.
    install_dest_json_fragment = json.dumps(install_dest)[1:-1]

    # Prepare the paths to the installed kernel.json and the one bundled with this installer.
    local_kernel_json_path = os.path.join(os.path.dirname(os.path.abspath(__file__)), 'sysml', 'kernel.json')
    installed_kernel_json_path = os.path.join(install_dest, 'kernel.json')

    # Replace the @KERNEL_INSTALL_DIRECTORY@ token with the path to where the kernel was installed
    # in the installed kernel.json from the local template.
    with open(local_kernel_json_path, 'r') as template_kernel_json_file:
        template_kernel_json_contents = template_kernel_json_file.read()
        kernel_json_contents = template_kernel_json_contents.replace(
            '@KERNEL_INSTALL_DIRECTORY@',
            install_dest_json_fragment
        )
        kernel_json_json_contents = json.loads(kernel_json_contents)
        kernel_env = kernel_json_json_contents.setdefault('env', {})
        for k, v in args.env.items():
            kernel_env[k] = v
        with open(installed_kernel_json_path, 'w') as installed_kernel_json_file:
            json.dump(kernel_json_json_contents, installed_kernel_json_file, indent=4, sort_keys=True)

    print('Installed sysml kernel into "%s"' % install_dest)
