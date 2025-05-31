#!/bin/bash

# ─────────────────────────────────────────────
# Script: Git Exercise - Create Branch & Pull Request
# Purpose: Create a new branch, edit README2.md,
#          commit the changes, push to GitHub, and prompt for manual PR creation.
# Usage
#   cd "/e/_SoftEng/_BeCode/Exquisite-corpse-Schillings/git-bash-zsh-scripts"  
#   bash 55-Git-exercice-2.sh
# ─────────────────────────────────────────────

# Clear screen
clear

# Step 1: Set the name of the branch
MY_BRANCH="yves-branch"

# Step 2: Show all local and remote branches
echo -e "\nStep 2: Listing all branches (local + remote)"
git branch -a

# Step 3: Create the new branch (if it doesn't already exist)
echo -e "\nStep 3: Creating branch '$MY_BRANCH'"
git branch "$MY_BRANCH"

# Step 4: Switch to the new branch
echo -e "\nStep 4: Switching to branch '$MY_BRANCH'"
git checkout "$MY_BRANCH"

# Step 5: Create README2.md if it doesn't exist
echo -e "\nStep 5: Checking if README2.md exists"
if [ ! -f "README2.md" ]; then
  touch README2.md
  echo "README2.md has been created."
fi

# Step 6: Append 3 lines to README2.md from this branch
echo -e "\nStep 6: Appending text to README2.md"
echo -e "\nLine 1 from $MY_BRANCH" >> README2.md
echo "Line 2 from $MY_BRANCH" >> README2.md
echo "Line 3 from $MY_BRANCH" >> README2.md

# Step 7: Stage the updated file
echo -e "\nStep 7: Staging README2.md"
git add README2.md

# Step 8: Commit the changes
echo -e "\nStep 8: Committing changes"
git commit -m "Add 3 lines to README2.md from $MY_BRANCH"

# Step 8.5: Make sure the branch is up to date with remote before pushing
echo -e "\nStep 8.5: Pulling latest changes from remote branch before pushing (rebase)"
git pull origin "$MY_BRANCH" --rebase

# Step 9: Push the branch to GitHub
echo -e "\nStep 9: Pushing branch '$MY_BRANCH' to origin"
git push origin "$MY_BRANCH"

# Step 10: Prompt the user to create a Pull Request manually
echo -e "\nStep 10: Manual Pull Request"
echo -e "Go to GitHub and create a Pull Request from '$MY_BRANCH' to 'main'."
echo -e "Click the \"Compare and pull request\" button to open the PR."
read -p "Press [Enter] once the Pull Request has been merged..."

# Step 11: Switch back to main and pull the latest changes
echo -e "\nStep 11: Switching to 'main' and pulling latest changes"
git checkout main
git pull origin main

# Step 12: Show the last 5 lines of README2.md for verification
echo -e "\nStep 12: Verifying the last 5 lines of README2.md"
tail -n 5 README2.md

# Step 13: Show all local branches
echo -e "\nStep 13: Listing all local branches"
git branch

# Step 14: Delete the local branch
# This script deletes a local Git branch specified by the variable MY_BRANCH.
# Normally, Git prevents you from deleting a branch that has unmerged changes 
# to protect you from losing work. Using -D overrides this safety check and 
# forces the deletion of the branch.
echo -e "\nStep 14: Deleting local branch '$MY_BRANCH'"
git branch -D "$MY_BRANCH"


# Step 13: Show all local branches after deletion of $MY_BRANCH
echo -e "\nStep 13: Listing all local branches after deletion of '$MY_BRANCH'"
git branch


# Step 14: Show remaining remote branches
echo -e "\nStep 14: Listing remote branches"
git branch -r

# Step 15: Script completed
echo -e "\nScript complete. The branch '$MY_BRANCH' has been merged and deleted locally."
