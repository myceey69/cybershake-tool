#!/bin/bash

echo "---------------------------------------------"
echo "CyberShake Tool Setup Script for macOS"
echo "---------------------------------------------"

# --- Check Python ---
echo "Checking for Python..."
if ! command -v python3 &> /dev/null; then
    echo "Python 3 not found. Please install it using Homebrew:"
    echo "  brew install python"
    exit 1
else
    echo "Python 3 is already installed."
fi

# --- Check Git ---
echo "Checking for Git..."
if ! command -v git &> /dev/null; then
    echo "Git not found. Installing Git..."
    brew install git
else
    echo "Git is already installed."
fi

# --- Create virtual environment ---
echo "Creating Python virtual environment..."
python3 -m venv venv

# --- Activate virtual environment ---
echo "Activating environment..."
source venv/bin/activate

# --- Upgrade pip ---
echo "Upgrading pip..."
pip install --upgrade pip

# --- Install required Python packages ---
echo "Installing required Python packages..."
pip install numpy pandas sqlalchemy mysql-connector-python configparser pymysql

# --- Done ---
echo
echo "✅ CyberShake Tool environment setup is complete."
echo
echo "To activate your environment later, run:"
echo "    source venv/bin/activate"
echo
echo "Then start the tool with:"
echo "    python run_retrieve.py"
echo "---------------------------------------------"
