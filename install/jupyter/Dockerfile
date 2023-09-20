FROM condaforge/mambaforge:23.3.1-1 
# https://hub.docker.com/r/condaforge/mambaforge/tags

RUN mamba install -y -v python=3.* jupyterlab=2.* graphviz=2.* nodejs=14.*
RUN mamba install -y -v jupyter-sysml-kernel=0.35.0

COPY ./install.py .
RUN python ./install.py

# fix: Error "TypeError: warn() missing 1 required keyword-only argument: 'stacklevel'" 
RUN pip uninstall -y traitlets && pip install traitlets==5.9.0

# work in the /home directory so we can map volumes
WORKDIR /home

CMD ["jupyter", "lab", "--ip='*'", "--port=8888", "--allow-root", "--no-browser", "--NotebookApp.token=''", "--NotebookApp.password=''"]