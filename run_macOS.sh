#!/bin/bash

# Navigate to the script's directory (optional)
cd "$(dirname "$0")"

# Run the Python script
python3 run_retrieve.py

# Pause (wait for user to press Enter)
read -p "Press Enter to exit..."
