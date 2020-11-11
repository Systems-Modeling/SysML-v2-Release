#!/bin/sh
#
# SysML 2 Pilot Implementation
# Copyright (C) 2020  California Institute of Technology ("Caltech")
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

echo "--- Step 1: Testing Conda installation ---"
command -v conda || (echo "Conda is not installed. Please install Conda and re-run." && return 1)
conda --version

echo "--- Step 2: Testing Java installation ---"
command -v java || (echo "Java is not installed. Please install Java and re-run." && return 1)
java -version

echo "--- Step 3: Installing dependencies into Conda environment ---"
conda install python=3.* jupyterlab=2.* graphviz=2.* nodejs=14.* -c conda-forge -y

echo "--- Step 4: Testing Python 3 installation ---"
command -v python3 || (echo "Python 3 is not installed. Please manually install it." && return 1)

echo "--- Step 5: Testing Graphviz installation ---"
command -v dot || (echo "Graphviz is not installed. Please manually install it." && return 1)

echo "--- Step 6: Testing Node.js installation ---"
command -v node || (echo "Node.js is not installed. Please manually install it." && return 1)

echo "--- Step 7: Installing SysML Jupyter kernel ---"
jupyter kernelspec remove sysml -f > /dev/null 2>&1 || true
python3 "$(dirname $0)/install.py" --sys-prefix --api-base-path=http://sysml2.intercax.com:9000 "--graphviz-path=$(command -v dot)" "$@"

echo "--- Step 8: Installing JupyterLab extension for SysML ---"
jupyter labextension uninstall jupyterlab-sysml > /dev/null 2>&1 || true
jupyter labextension install "$(dirname $0)/jupyterlab-sysml/package"

echo "--- Step 9: Running Jupyter environment ---"
echo "To launch JupyterLab you can now run \"jupyter lab\" from Command Prompt."
echo "Re-running this script is not necessary and will re-install the environment."
printf "\n\n"