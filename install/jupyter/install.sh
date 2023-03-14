#!/bin/sh
#
# SysML 2 Pilot Implementation
# Copyright (C) 2020 California Institute of Technology ("Caltech")
# Copyright (C) 2021 Twingineer LLC
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

SYSML_VERSION="0.33.0"

echo "--- Step 1: Testing Conda installation ---"
command -v conda || (echo "Conda is not installed. Please install Conda and re-run." && return 1)
conda --version

echo "--- Step 2: Testing Java installation ---"
command -v java || (echo "Java is not installed. Please install Java and re-run." && return 1)
java -version

echo "--- Step 3: Installing Jupyter SysML kernel and dependencies ---"
jupyter kernelspec remove sysml -f > /dev/null 2>&1 || true
conda install "jupyter-sysml-kernel=$SYSML_VERSION" python=3.* jupyterlab=2.* graphviz=2.* nodejs=14.* -c conda-forge -y

echo "--- Step 4: Installing JupyterLab SysML extension ---"
jupyter labextension uninstall @systems-modeling/jupyterlab-sysml > /dev/null 2>&1 || true
jupyter labextension install "@systems-modeling/jupyterlab-sysml@$SYSML_VERSION"

echo "--- Step 5: Customizing JupyterLab ---"
python3 "$(dirname $0)/install.py"

echo "--- Step 6: Running Jupyter environment ---"
echo "To launch JupyterLab you can now run \"jupyter lab\" from Command Prompt."
echo "Re-running this script is not necessary and will re-install the environment."
printf "\n\n"