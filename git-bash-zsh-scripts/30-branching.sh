#!/bin/bash

# ──────────────────────────────────────────────────────────────
# Note: This script is designed to be run in a bash-compatible environment.    
# ──────────────────────────────────────────────────────────────
# Title: Git Exercise 3 – Branching, Merging & Conflict Resolution
#
# Description: This script simulates a typical Git workflow involving branching, merging, and conflict resolution.
#              It creates a new branch (`dev-branch`), performs commits, merges it into `master`, then creates a
#              conflicting `feature_branch` to demonstrate manual conflict handling.
# 
# Author: Yves Schillings
# Date: 28-05-2025
#
# Usage:
#   Change directory:(read README.md to see how to use yours) 
#     cd "/e/_SoftEng/_BeCode/Exquisite-corpse-Schillings/git-bash-zsh-scripts"  
#   Then run:
#     bash 30-branching.sh
# ──────────────────────────────────────────────────────────────

echo -e "\n>>> [Exercise 3] Branching, Merging & Conflict Resolution\n"

# Go to exercise1 directory created earlier
cd ~/becode/exercise1 || { echo -e "Error: Directory '~/becode/exercise1' not found\n"; exit 1; }

# Reset the repository to a clean state
echo -e "# Resetting working tree to clean state\n"
git reset --hard HEAD
git clean -fd

# Delete branches if they already exist
git branch -D dev-branch 2>/dev/null
git branch -D feature_branch 2>/dev/null

# Create and switch to dev-branch
echo -e "# Creating new branch: dev-branch\n"
git checkout -b dev-branch

# Apply 3 changes in dev-branch and commit
echo -e "# Adding 3 changes on dev-branch\n"
echo "def greet():" > my_code.py
echo "    print('Hello from dev branch')" >> my_code.py
git add my_code.py
git commit -m "Add greet() function in dev-branch"

echo "def add(a, b):" >> my_code.py
echo "    return a + b" >> my_code.py
git commit -am "Add add(a, b) function in dev-branch"

echo "if __name__ == '__main__':" >> my_code.py
echo "    greet()" >> my_code.py
git commit -am "Add __main__ block in dev-branch"

# Switch back to master and merge dev-branch
echo -e "\n# Switching back to master and merging dev-branch\n"
git checkout master
git merge dev-branch

# Make 2 changes on master branch and commit
echo -e "\n# Making 2 changes in master branch\n"
echo "# Change A (master)" >> my_code.py
echo "# Change B (master)" >> my_code.py
git commit -am "Add two changes on master"

# Create and switch to feature_branch
echo -e "\n# Creating and switching to feature_branch\n"
git checkout -b feature_branch

# Make conflicting changes in feature_branch and commit
echo -e "\n# Making conflicting changes in feature_branch\n"
# Overwrite last lines to create conflict
sed -i '$d' my_code.py
echo "# Change A (feature_branch)" >> my_code.py
echo "# Change B (feature_branch)" >> my_code.py
git commit -am "Conflicting changes in feature_branch"

# Merge feature_branch into master
echo -e "\n# Switching back to master for merge with feature_branch\n"
git checkout master

echo -e "\n# Merging feature_branch into master (conflict expected)\n"
git merge feature_branch || echo -e "Attention: Merge conflict detected!\n"

# Instructions for manual resolution
echo -e "\n>>> MANUAL ACTION REQUIRED:\n"
echo -e "1. Open 'my_code.py' and resolve the conflict."
echo -e "2. Choose which changes to keep."
echo -e "3. Then run:"
echo -e "   git add my_code.py"
echo -e "   git commit -m 'Resolved merge conflict'\n"

echo -e "[Exercise 3] completed.\n"

# End of script
# ──────────────────────────────────────────────────────────────
# Note: This script is designed to be run in a bash-compatible environment.  