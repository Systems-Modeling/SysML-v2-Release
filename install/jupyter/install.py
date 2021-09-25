import json
import os
from jupyterlab.labapp import get_app_dir

if __name__ == '__main__':
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
