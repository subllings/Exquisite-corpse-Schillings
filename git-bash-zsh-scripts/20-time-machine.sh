#!/bin/bash

# ──────────────────────────────────────────────────────────────
# Note: This script is designed to be run in a bash-compatible environment.    
# ──────────────────────────────────────────────────────────────
# Title: Exercise 2 - Git Logs & Checkout - Time Machine
#
# Description: This script clones a repo, explores its commit history, and traces
#              the evolution of the variable TARGET in client.py
#
# Author: Yves Schillings
# Date: 28-05-2025
#
# Usage: 
#    Change directory (read README.md to see how to use yours):  
#       cd "/e/_SoftEng/_BeCode/Exquisite-corpse-Schillings/git-bash-zsh-scripts"  
#    Run with: 
#       bash 20-time-machine.sh
# ──────────────────────────────────────────────────────────────

echo -e "\n>>> [Exercise 2] Git Logs & Checkout - Time Machine \n"

# Navigate to the Becode workspace
cd ~/becode || { echo -e "Error : 'becode' folder not found\n"; exit 1; }

# Check and clone the repository
if [ ! -d "/e/_SoftEng/_BeCode/BeCode-GitClone-ScripTest/git-test-ai" ]; then
    echo -e "\n# Cloning repository from GitHub...\n"

    # Delete the existing folder if it exists
    if [ -d "/e/_SoftEng/_BeCode/BeCode-GitClone-ScripTest/git-test-ai" ]; then
        echo -e "\n Attention: Existing 'git-test-ai' folder found — deleting it..."
        rm -rf "/e/_SoftEng/_BeCode/BeCode-GitClone-ScripTest/git-test-ai"
    fi

    # Create and go to target folder
    mkdir -p "/e/_SoftEng/_BeCode/BeCode-GitClone-ScripTest"
    cd "/e/_SoftEng/_BeCode/BeCode-GitClone-ScripTest" || { echo -e "Error : Failed to access target directory\n"; exit 1; }

    # Clone the repository into this folder
    echo -e "\n Cloning repository from GitHub...\n"
    git clone https://github.com/becodeorg/git-test-ai.git
else
    echo -e "\n# Repository already cloned.\n"
    cd "/e/_SoftEng/_BeCode/BeCode-GitClone-ScripTest"
fi

# Enter the cloned repository
cd git-test-ai || { echo -e "Error: Cannot enter 'git-test-ai' folder\n"; exit 1; }

# Show the first commits to find the initial commit
echo -e "\n# Showing first commits in the repository:\n"
git log --reverse --oneline

# Get the hash of the first commit
first_commit=$(git rev-list --max-parents=0 HEAD)
echo -e "\n# First commit hash: $first_commit\n"

# Show who created the initial commit and when
echo -e "# First commit details:\n"
git show "$first_commit" --no-patch --pretty=format:"Author: %an <%ae>%nDate: %ad%nMessage: %s"

# Check the initial value of TARGET in client.py
echo -e "\n# Initial value of TARGET in client.py:\n"
git checkout "$first_commit"
grep "TARGET" client.py || echo -e "TARGET not found in initial version."

# Return to latest commit (main or master branch)
git checkout main 2>/dev/null || git checkout master

# Show how TARGET evolved in the Git history
echo -e "\n# Evolution of TARGET in client.py across history:\n"
git log -p --follow -- client.py | grep "TARGET" | grep -v '^-' || echo -e "No changes to TARGET found."

# Use git diff to compare changes in TARGET between two latest commits
echo -e "\n# Using git diff to compare last two commits of client.py:\n"
git diff HEAD~1 HEAD -- client.py

echo -e "\n [Exercise 2] completed\n"

# End of script
# ──────────────────────────────────────────────────────────────
# Note: This script is designed to be run in a bash-compatible environment.     

