@echo off
setlocal enabledelayedexpansion

:: --- Header ---
echo ---------------------------------------------
echo CyberShake Tool Setup Script for Windows
echo ---------------------------------------------

:: --- Install Python (if not already installed) ---
echo Checking for Python...
python --version >nul 2>&1
IF %ERRORLEVEL% NEQ 0 (
    echo Python not found. Installing Python 3...
    winget install --id Python.Python.3 -e --source winget
) ELSE (
    echo Python is already installed.
)

:: --- Install Git (if not already installed) ---
echo Checking for Git...
git --version >nul 2>&1
IF %ERRORLEVEL% NEQ 0 (
    echo Git not found. Installing Git...
    winget install --id Git.Git -e --source winget
) ELSE (
    echo Git is already installed.
)

:: --- Wait for environment updates ---
echo Waiting 10 seconds to ensure PATH updates...
timeout /t 10

:: --- Create virtual environment ---
echo Creating Python virtual environment...
python -m venv venv

:: --- Activate the virtual environment ---
echo Activating environment...
call venv\Scripts\activate

:: --- Upgrade pip ---
echo Upgrading pip...
python -m pip install --upgrade pip

:: --- Install required Python packages ---
echo Installing required Python packages...
pip install numpy pandas sqlalchemy mysql-connector-python configparser pymysql

:: --- Finish ---
echo.
echo ✅ CyberShake Tool environment setup is complete.
echo To start working, activate your environment:
echo     venv\Scripts\activate
echo.
echo Then run your CyberShake tool with:
echo     python run_retrieve.py
echo ---------------------------------------------

pause
