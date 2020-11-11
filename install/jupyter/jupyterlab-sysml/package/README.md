# JupyterLab SysMLv2 Extension

Adds syntax highlighting to code cells in JupyterLab for the SysMLv2 language.


## Install locally

Start by ensuring you are in the desired conda env with the isysml kernel installed, for example:
```console
$ conda create --name sysml
$ conda activate sysml
$ cd isysml && ./install.sh
```

From this directory:
```console
$ yarn install
$ yarn run build
$ jupyter labextension install .
$ jupyter lab
```
