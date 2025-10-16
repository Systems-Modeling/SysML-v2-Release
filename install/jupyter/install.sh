#!/bin/sh
#
# SysML 2 Pilot Implementation
# Copyright (C) 2020 California Institute of Technology ("Caltech")
# Copyright (C) 2021 Twingineer LLC
# Copyright (C) 2021 Model Driven Solutions, Inc.
#
# This program is free software: you can redistribute it and/or modify
# it under the terms of the GNU Lesser General Public License as published by
# the Free Software Foundation, either version 3 of the License, or
# (at your option) any later version.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU Lesser General Public License for more details.
# You should have received a copy of the GNU Lesser General Public License
# along with this program.  If not, see <https://www.gnu.org/licenses/>.
#
# @license LGPL-3.0-or-later <http://spdx.org/licenses/LGPL-3.0-or-later>
#

set -e

SYSML_VERSION="0.52.0"
SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"

echo "--- Step 1: Testing Conda installation ---"
command -v conda || (echo "Conda is not installed. Please install Conda and re-run." && return 1)
conda --version

echo "--- Step 2: Testing Java installation ---"
command -v java || (echo "Java is not installed. Please install Java and re-run." && return 1)
java -version

echo "--- Step 3: Installing Jupyter SysML kernel and dependencies ---"
CREATE_ENV=false
if [ -n "$CONDA_PREFIX" ]; then
    TARGET_PREFIX="$CONDA_PREFIX"
    echo "Using active Conda environment at: $TARGET_PREFIX"
else
    BASE_PREFIX="$(conda info --base)"
    TARGET_PREFIX="$BASE_PREFIX/envs/sysml-$SYSML_VERSION"
    if [ -d "$TARGET_PREFIX" ]; then
        echo "Using existing Conda environment at: $TARGET_PREFIX"
    else
        echo "Creating Conda environment at: $TARGET_PREFIX"
        CREATE_ENV=true
    fi
fi

conda run --prefix "$TARGET_PREFIX" jupyter kernelspec remove sysml -f > /dev/null 2>&1 || true

if [ "$CREATE_ENV" = true ]; then
    conda create --prefix "$TARGET_PREFIX" "jupyter-sysml-kernel=$SYSML_VERSION" python=3.* jupyterlab=3.* graphviz=2.* nodejs="<17" -c conda-forge -y
else
    conda install --prefix "$TARGET_PREFIX" "jupyter-sysml-kernel=$SYSML_VERSION" python=3.* jupyterlab=3.* graphviz=2.* nodejs="<17" -c conda-forge -y
fi

echo "--- Step 3b: Registering SysML kernel with Jupyter ---"
if conda run --prefix "$TARGET_PREFIX" test -d "$TARGET_PREFIX/share/jupyter/kernels/sysml"; then
    if ! conda run --prefix "$TARGET_PREFIX" jupyter kernelspec install --replace --user "$TARGET_PREFIX/share/jupyter/kernels/sysml"; then
        echo "Warning: failed to register SysML kernel globally. You may need to run 'jupyter kernelspec install --user \"$TARGET_PREFIX/share/jupyter/kernels/sysml\"' manually."
    fi
else
    echo "Warning: SysML kernelspec directory not found at $TARGET_PREFIX/share/jupyter/kernels/sysml; skipping install."
fi

echo "--- Step 4: Installing JupyterLab SysML extension ---"
conda run --prefix "$TARGET_PREFIX" jupyter labextension uninstall @systems-modeling/jupyterlab-sysml > /dev/null 2>&1 || true
conda run --prefix "$TARGET_PREFIX" jupyter labextension install "@systems-modeling/jupyterlab-sysml@$SYSML_VERSION"

echo "--- Step 5: Customizing JupyterLab ---"
conda run --prefix "$TARGET_PREFIX" python "$SCRIPT_DIR/install.py"

echo "--- Step 6: Running Jupyter environment ---"
if [ -n "$CONDA_PREFIX" ]; then
    echo "To launch JupyterLab you can now run \"jupyter lab\" while this environment is active."
else
    echo "To launch JupyterLab run the following commands:"
    echo "  conda activate \"$TARGET_PREFIX\""
    echo "  jupyter lab"
fi
echo "Re-running this script is not necessary and will re-install the environment."
printf "\n\n"
