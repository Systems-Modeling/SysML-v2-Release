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
call conda install python=3.* jupyter=1.0.* -y || goto:error
call conda install graphviz=2.* -c conda-forge -y || goto:error

echo --- Step 4: Testing Python installation ---
where python
if errorlevel 1 (
    echo Python is not installed. Please manually install it.
    goto :error
)

echo --- Step 5: Installing SysML v2 Jupyter kernel ---
call jupyter kernelspec remove sysml -f
for /F usebackq %%A in (`where dot`) do (
  call python "%~dp0\install.py" --sys-prefix --api-base-path=http://sysml2.intercax.com:9000 "--graphviz-path=%%A%%" %* || goto:error
)

echo --- Step 6: Installing Jupyter notebook extension for codefolding ---
call conda install jupyter_contrib_nbextensions -c conda-forge -y || goto:error
call jupyter contrib nbextension install --sys-prefix || goto:error
call jupyter nbextension enable codefolding/main --sys-prefix || goto:error

echo --- Step 7: Running Jupyter environment ---
echo To launch Jupyter you can now run ^"jupyter notebook^" from Command Prompt.
echo Re-running this script is not necessary and will re-install the environment.
echo(
echo(
cmd /k
goto :EOF

:error
echo Failed with error #%errorlevel%.
pause
exit /b %errorlevel%