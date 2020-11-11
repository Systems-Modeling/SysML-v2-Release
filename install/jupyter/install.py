import json
import os
import shutil
import subprocess
import sys
from jupyterlab.labapp import get_app_dir

if __name__ == '__main__':
    search = 'sysml.library'
    d = os.path.dirname(os.path.realpath(__file__))

    while d != '/' and search not in os.listdir(d):
        d = os.path.abspath(os.path.join(d, '..'))

    match = os.path.join(d, search)
    if not os.path.isdir(match):
        sys.exit(f'Could not find {search} directory.')

    kernel_name = 'jupyter-sysml-kernel'
    kernel_dir = os.path.join(os.path.dirname(os.path.realpath(__file__)), kernel_name)
    if not os.path.isdir(kernel_dir):
        sys.exit(f'Could not find {kernel_dir} directory.')

    lib_copy = os.path.join(kernel_dir, 'sysml', search)
    shutil.copytree(match, lib_copy)
    try:
        result = subprocess.run(['python', os.path.join(kernel_dir, 'install.py')] + sys.argv[1:], capture_output=True,
                                cwd=kernel_dir)
        sys.stdout.buffer.write(result.stdout)
        sys.stderr.buffer.write(result.stderr)
        if result.returncode > 0:
            sys.exit(result.returncode)
    finally:
        shutil.rmtree(lib_copy)

    # Enable line numbers and code folding by default
    override_file = os.path.join(get_app_dir(), 'settings', 'overrides.json')
    settings = {
        '@jupyterlab/notebook-extension:tracker': {
            'codeCellConfig': {
                'lineNumbers': True,
                'codeFolding': True
            }
        }
    }
    os.makedirs(os.path.dirname(override_file), exist_ok=True)
    with open(override_file, 'w+') as f:
        f.write(json.dumps(settings))
