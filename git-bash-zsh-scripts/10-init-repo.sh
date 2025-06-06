#!/bin/bash

# ──────────────────────────────────────────────────────────────
# Note: This script is designed to be run in a Zsh or Bash environment.
# ──────────────────────────────────────────────────────────────
# Title: Exercise 1 - Git Init & First Commits
#
# Description: This script initializes a new Git repository, creates
#              a Python file (client.py), performs several commits,
#              and displays the commit history.
#
# Author: Yves Schillings
# Date: 28-05-2025
#
# Usage:
#   - Bash:
#      Change directory (read README.md to see how to use yours)  
#      cd "/e/_SoftEng/_BeCode/Exquisite-corpse-Schillings/git-bash-zsh-scripts"   
#      bash 10-init-repo.sh
#
#   - Zsh:
#       cd "/mnt/e/_SoftEng/_BeCode/Exquisite-corpse-Schillings/git-bash-zsh-scripts"
#       ./10-init-repo.sh
# ──────────────────────────────────────────────────────────────


# Clear the screen 
# clear

# Show current directory
echo -e "\n# Current directory: $(pwd)\n"
ls

echo -e "\n# [Exercise 1] Git Init & First Commits\n"

# 'becode' folder must exist
mkdir -p ~/becode || { echo -e "\nError: Could not create 'becode' folder\n"; exit 1; }

# Change to becode directory, exit if it doesn't exist
cd ~/becode || { echo -e "\nError: 'becode' folder not found\n"; exit 1; }
mkdir -p exercise1
cd exercise1 || exit

echo -e "\n# Git status before init\n"
git status || echo -e "\nNot a Git repository yet\n"

echo -e "\n# Init repo\n"
cd "/e/_SoftEng/_BeCode/BXL-Bouman-9/01-TheField/01-Terminal/03-NewGit"
git init

echo -e "\n# Git status after init\n"
git status

echo -e "\n# Create client.py\n"
echo "# My initial Python code" > client.py

echo -e "\n# First commit\n"
git add client.py
git commit -m "Initial commit: added client.py"

echo -e "\n# Second commit\n"
echo "print('Hello, BeCode!')" >> client.py
git commit -am "Second commit: added print statement"

echo -e "\n# Third commit\n"
echo "print('Another line')" >> client.py
git commit -am "Third commit: added another line"

echo -e "\n# Log history\n"
git log --oneline | head -n 5

echo -e "\n>>> [Exercise 1] completed \n"

# End of script
# ──────────────────────────────────────────────────────────────
# Note: This script is designed to be run in a Zsh or Bash environment.

