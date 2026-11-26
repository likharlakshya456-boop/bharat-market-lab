@echo off
rem One-time install on Windows: a private Python environment, the libraries, then your own data and backtest (10-20 min).
cd /d "%~dp0"
set PYTHONUTF8=1
where py >nul 2>nul && (set PY=py -3) || (set PY=python)
%PY% -c "import sys; assert sys.version_info >= (3, 10)" || (echo Python 3.10+ is needed: https://www.python.org/downloads/ & pause & exit /b 1)
%PY% -m venv .venv || goto failed
.venv\Scripts\python -m pip install -q --upgrade pip || goto failed
.venv\Scripts\python -m pip install -q -r requirements.txt || goto failed
if not exist data mkdir data
.venv\Scripts\python -m lab.setup || goto failed
echo.
echo Installed. Start it any time with run.bat
pause
exit /b 0

:failed
echo Installation did not finish. Review the error above, then run install.bat again.
pause
exit /b 1
