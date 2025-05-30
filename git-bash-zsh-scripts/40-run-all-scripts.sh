#!/bin/bash

# ──────────────────────────────────────────────────────────────
# Note: This script is designed to be run in a Bash or Zsh environment.
# ──────────────────────────────────────────────────────────────
# Title : Master Script – Run All Git Exercises
#
# Description: This script sequentially executes three exercises:
#              1. Git initialization and first commits
#              2. Exploring commit history and using checkout
#              3. Branching, merging, and conflict resolution
#
# Author: Yves Schillings
# Date: 28-05-2025
#
# Usage:
#   Change directory: (read README.md to see how to use yours) 
#     cd "/e/_SoftEng/_BeCode/Exquisite-corpse-Schillings/git-bash-zsh-scripts"  
#   Then run with:
#     bash 40-run-all-scripts.sh
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
if [ -f "./20-time-machine.sh" ]; then
    bash ./20-time-machine.sh
else
    echo -e "Error: Missing script: 2-time-machine.sh"
    exit 1
fi

# Step 3: Run Exercise 3
echo -e "\n=========== Running Exercise 3: Branching & Merging"
if [ -f "./30-branching.sh" ]; then
    bash ./30-branching.sh
else
    echo -e "Error: Missing script: 3-branching.sh"
    exit 1
fi

echo -e "\n========== All scripts completed.\n"