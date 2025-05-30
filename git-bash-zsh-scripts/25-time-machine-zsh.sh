#!/bin/bash

# ──────────────────────────────────────────────────────────────
# Note: This script is designed to be run in a Zsh environment.    
# ──────────────────────────────────────────────────────────────
# Title : Exercise 2, Git Logs & Checkout - Time Machine
#
# Description: This script clones a repo, explores its commit history, and traces
#              the evolution of the variable TARGET in client.py
#
# Author: Yves Schillings
# Date: 28-05-2025
#
# Usage:
#   Change directory: (read README.md to see how to use yours)  
#     cd "/mnt/e/_SoftEng/_BeCode/Exquisite-corpse-Schillings/git-bash-zsh-scripts"
#   Then run:
#     ./25-time-machine.sh
# ──────────────────────────────────────────────────────────────

echo -e "\n>>> [Exercise 2] Git Logs & Checkout - Time Machine \n"

# Disable git pager for clean terminal output
export GIT_PAGER=cat

# Define variables
REPO_URL="https://github.com/becodeorg/git-test-ai.git"
TARGET_DIR="/mnt/e/_SoftEng/_BeCode/BeCode-GitClone-ScripTest/git-test-ai"
PARENT_DIR=$(dirname "$TARGET_DIR")

# Ensure parent directory exists
mkdir -p "$PARENT_DIR"

# Clone repo if not present
if [ ! -d "$TARGET_DIR/.git" ]; then
  echo -e "\nCloning repository from GitHub...\n"
  rm -rf "$TARGET_DIR" 2>/dev/null
  git clone "$REPO_URL" "$TARGET_DIR"
else
  echo -e "\n# Repository already cloned.\n"
fi

# Enter repo directory
cd "$TARGET_DIR" || { echo "Error: Cannot enter directory"; exit 1; }

# Git identity (required if commits are created later)
git config --global user.name "subllings"
git config --global user.email "subllings@gmail.com"

# Show the first commits
echo -e "\n# Showing first commits in the repository:\n"
git log --reverse --oneline | head -n 3

# Get hash of the first commit
first_commit=$(git rev-list --max-parents=0 HEAD)
echo -e "\n# First commit hash: $first_commit\n"

# Show first commit details
echo -e "# First commit details:\n"
git show "$first_commit" --no-patch --pretty=format:"Author: %an <%ae>%nDate: %ad%nMessage: %s"

# Check initial value of TARGET in client.py
echo -e "\n# Initial value of TARGET in client.py:\n"
git checkout "$first_commit" >/dev/null 2>&1
if [ -f client.py ]; then
  grep "TARGET" client.py || echo -e "TARGET not found in initial version."
else
  echo -e "client.py not found in initial commit."
fi

# Return to latest commit (main or master)
git checkout main 2>/dev/null || git checkout master

# Show evolution of TARGET in history
echo -e "\n# Evolution of TARGET in client.py across history:\n"
if [ -f client.py ]; then
  git log -p --follow -- client.py | grep "TARGET" | grep -v '^-' || echo -e "No changes to TARGET found."
else
  echo -e "client.py not found in latest version."
fi

# Compare last two commits of client.py
echo -e "\n# Using git diff to compare last two commits of client.py:\n"
if [ -f client.py ]; then
  git diff HEAD~1 HEAD -- client.py
else
  echo -e "client.py not found, cannot diff."
fi

echo -e "\n[Exercise 2] completed.\n"
# Reset GIT_PAGER to default
unset GIT_PAGER

# End of script
# ──────────────────────────────────────────────────────────────
# Note: This script is designed to be run in a Zsh environment.     

