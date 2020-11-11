@echo off

echo --- Step 1: Testing Conda installation ---
where conda
if errorlevel 1 (
    echo Conda is not installed. Please install Conda and re-run.
    goto :error
)
call conda --version || goto :error

echo --- Step 2: Testing Java installation ---
where java
if errorlevel 1 (
    echo Java is not installed. Please install Java and re-run.
    goto :error
)
call java -version || goto :error

echo --- Step 3: Installing dependencies into Conda environment ---
call conda install python=3.* jupyterlab=2.* graphviz=2.* nodejs=14.* -c conda-forge -y || goto:error

echo --- Step 4: Testing Python installation ---
where python
if errorlevel 1 (
    echo Python is not installed. Please manually install it.
    goto :error
)

echo --- Step 5: Testing Graphviz installation ---
where dot
if errorlevel 1 (
    echo Graphviz is not installed. Please manually install it.
    goto :error
)

echo --- Step 6: Testing Node.js installation ---
where node
if errorlevel 1 (
    echo Node.js is not installed. Please manually install it.
    goto :error
)

echo --- Step 7: Installing SysML Jupyter kernel ---
call jupyter kernelspec remove sysml -f >nul 2>&1
for /F "usebackq tokens=*" %%A in (`where dot`) do (
  call python "%~dp0\install.py" --sys-prefix --api-base-path=http://sysml2.intercax.com:9000 "--graphviz-path=%%A%%" %* || goto:error
  goto:done
)
:done

echo --- Step 8: Installing JupyterLab extension for SysML ---
call jupyter labextension uninstall jupyterlab-sysml
call jupyter labextension install "%~dp0\jupyterlab-sysml\package" || goto:error

echo --- Step 9: Running Jupyter environment ---
echo To launch JupyterLab you can now run ^"jupyter lab^" from Command Prompt.
echo Re-running this script is not necessary and will re-install the environment.
echo(
echo(
cmd /k
goto :EOF

:error
echo Failed with error #%errorlevel%.
pause
exit /b %errorlevel%