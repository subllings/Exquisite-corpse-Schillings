#!/bin/bash

# ─────────────────────────────────────────────
# Usage:
#   Change directory: (read README.md to see how to use yours) 
#     cd "/e/_SoftEng/_BeCode/Exquisite-corpse-Schillings"  
#   Then run with:
#     bash 50-exercice2.sh
# ─────────────────────────────────────────────

# Replace with your name or pass as an argument
MY_BRANCH="yves-branch"  

# 1. Show all branches (local + remote)
git branch -a

# 2. Create the branch
git branch "$MY_BRANCH"

# 3. Switch to the new branch
git checkout "$MY_BRANCH"

# 4. Create README2.md if not exists, and add 3 lines
# Create a new field README2.md if it does not exist (touch command)
if [ ! -f "README2.md" ]; then
  touch README2.md
fi

# Write 3 lines in the file 
echo -e "\nLine 1 from $MY_BRANCH" >> README2.md
echo "Line 2 from $MY_BRANCH" >> README2.md
echo "Line 3 from $MY_BRANCH" >> README2.md

# 5. Stage the new file
git add README2.md

# 6. Commit with message
git commit -m "Add 3 lines to README2.md from $MY_BRANCH"

# 7. Push the new branch
git push origin "$MY_BRANCH"

# 8. Prompt -  manual Pull Request - online interface on GitHub
echo -e "\nGo to GitHub and create a Pull Request from branch '$MY_BRANCH' to 'main'."
echo -e "\nAccept the pull-request by clicking "Compare and pull request button " from branch '$MY_BRANCH' to 'main'."
read -p "Press [Enter] once the PR has been merged..."

# 9. Pull latest main
git pull origin main

# 10. Switch to main
git checkout main

# 11. Check if the changes are in README2.md
echo -e "\nChecking the last 5 lines of README2.md:\n"
tail -n 5 README2.md

# 12. Delete the local branch
git branch -d "$MY_BRANCH"

# Show remote branches 
git branch -r

echo -e "\nScript complete. The branch '$MY_BRANCH' has been merged and deleted."
