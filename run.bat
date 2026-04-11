@echo off
echo ============================================
echo  Discord Countdown Timer
echo ============================================
echo.

python --version >nul 2>&1
if %ERRORLEVEL% NEQ 0 (
    echo ERROR: Python not found.  Install from https://python.org
    pause
    exit /b 1
)

echo Installing / verifying dependencies...
pip install -q pyttsx3
echo.

echo Starting timer...
python "%~dp0countdown_timer.py"

if %ERRORLEVEL% NEQ 0 (
    echo.
    echo Something went wrong.  Try:  pip install pyttsx3
    pause
)
