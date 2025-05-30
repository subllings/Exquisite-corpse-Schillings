#!/bin/bash

# ──────────────────────────────────────────────────────────────
# Note: This script is designed to be run in a Zsh environment.
# ──────────────────────────────────────────────────────────────
# Title: Exercise 3, Git Branching, Merging & Conflict Resolution
#
# Description : This script simulates a Git workflow involving multiple branches.
#               It creates a dev branch, makes several commits, merges into main,
#               then introduces a conflicting feature_branch to demonstrate manual
#               conflict resolution.
#
# Author: Yves Schillings
# Date: 28-05-2025
#
# Usage:
#   Change directory: (read README.md to see how to use yours) 
#     cd "/mnt/e/_SoftEng/_BeCode/Exquisite-corpse-Schillings/git-bash-zsh-scripts"
#   Then run:
#     ./35-branching.sh
# ──────────────────────────────────────────────────────────────

echo -e "\n>>> [Exercise 3] Branching & Merging\n"

# Reset working directory
echo -e "# Resetting working tree to clean state\n"
git reset --hard HEAD
git checkout main 2>/dev/null || git checkout master
git branch -D dev-branch 2>/dev/null
git branch -D feature_branch 2>/dev/null

# Ensure we're on main
BASE_BRANCH=$(git branch --show-current)
if [[ "$BASE_BRANCH" != "main" && "$BASE_BRANCH" != "master" ]]; then
    echo "Error: You are not on 'main' or 'master'. Exiting."
    exit 1
fi

# Create and switch to dev-branch
echo -e "# Creating new branch: dev-branch\n"
git checkout -b dev-branch

# Add changes on dev-branch
echo -e "# Adding 3 changes on dev-branch\n"
echo -e "def greet():\n    print(\"Hello\")" > my_code.py
git add my_code.py && git commit -m "Add greet() function in dev-branch"

echo -e "\ndef add(a, b):\n    return a + b" >> my_code.py
git add my_code.py && git commit -m "Add add(a, b) function in dev-branch"

echo -e "\nif __name__ == \"__main__\":\n    greet()" >> my_code.py
git add my_code.py && git commit -m "Add __main__ block in dev-branch"

# Switch back and merge dev-branch
echo -e "\n# Switching back to main and merging dev-branch\n"
git checkout main 2>/dev/null || git checkout master
git merge dev-branch --no-edit

# Make more changes on main
echo -e "\n# Making 2 changes in main branch\n"
echo -e "\n# Change from main branch" >> my_code.py
git add my_code.py && git commit -m "Add two changes on main"

# Create feature_branch
echo -e "\n# Creating and switching to feature_branch\n"
git checkout -b feature_branch

# Add conflicting change
echo -e "def greet():\n    print(\"Bonjour\")" > my_code.py
git add my_code.py && git commit -m "Conflicting changes in feature_branch"

# Merge with conflict
echo -e "\n# Switching back to main for merge with feature_branch\n"
git checkout main 2>/dev/null || git checkout master

echo -e "\n# Merging feature_branch into main (conflict expected)\n"
git merge feature_branch || {
    echo -e "\n>>> MANUAL ACTION REQUIRED:"
    echo -e "1. Open 'my_code.py' and resolve the conflict."
    echo -e "2. Choose which changes to keep."
    echo -e "3. Then run:\n   git add my_code.py && git commit -m 'Resolved merge conflict'"
}

echo -e "\n[Exercise 3] completed.\n"
# End of script
# ──────────────────────────────────────────────────────────────
# Note: This script is designed to be run in a Zsh environment.   
