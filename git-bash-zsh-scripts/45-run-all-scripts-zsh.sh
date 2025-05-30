#!/bin/bash

# ──────────────────────────────────────────────────────────────
# Note: This script is designed to be run in a Zsh environment.
# ──────────────────────────────────────────────────────────────
# Title : Master Script – Run All Git Exercises (Zsh Version)
#
# Description: This script sequentially runs three Git exercises:
#              1. Initializing a repository and making first commits
#              2. Navigating commit history and checking file states
#              3. Creating and merging branches with conflict handling
#
# Author: Yves Schillings
# Date: 28-05-2025
#
# Usage:
#   Change directory:(read README.md to see how to use yours) 
#     cd "/mnt/e/_SoftEng/_BeCode/Exquisite-corpse-Schillings/git-bash-zsh-scripts"
#   Then run with:
#     ./45-run-all-scripts-zsh.sh
# ──────────────────────────────────────────────────────────────

clear
echo -e "\n Running all scripts...\n"

# Step 1: Run Exercise 1
echo -e "\n=========== Running Exercise 1: Init & Commits"
if [ -f "./10-init-repo.sh" ]; then
    bash ./10-init-repo.sh
else
    echo -e "Error: Missing script: 1-init-repo.sh"
    exit 1
fi

# Step 2: Run Exercise 2
echo -e "\n========== Running Exercise 2: Logs & Checkout"
if [ -f "./25-time-machine-zsh.sh" ]; then
    bash ./25-time-machine-zsh.sh
else
    echo -e "Error: Missing script: 25-time-machine-zsh.sh"
    exit 1
fi

# Step 3: Run Exercise 3
echo -e "\n=========== Running Exercise 3: Branching & Merging"
if [ -f "./35-branching-zsh.sh" ]; then
    bash ./35-branching-zsh.sh
else
    echo -e "Error: Missing script: 3-branching.sh"
    exit 1
fi

echo -e "\n========== All scripts completed.\n"

# End of script
# ──────────────────────────────────────────────────────────────
# Note: This script is designed to be run in a Zsh environment.   