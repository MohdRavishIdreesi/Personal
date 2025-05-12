# ========================
# Git Essential Commands
# ========================

# Set global username and email
git config --global user.name "Your Name"
git config --global user.email "you@example.com"

# List current Git configuration
git config --list

# Initialize a new Git repository
git init

# Clone a Git repository
git clone https://github.com/user/repo.git

# Check status of working directory
git status

# Stage a specific file
git add filename.txt

# Stage all changes
git add .

# Unstage a staged file
git restore --staged filename.txt

# Discard changes in a file
git restore filename.txt

# Commit staged changes with message
git commit -m "Initial commit"

# Show commit history
git log

# Show commit history in one line
git log --oneline

# Show unstaged changes
git diff

# Show staged changes
git diff --staged

# Create a new branch
git branch new-feature

# List all branches
git branch

# Switch to another branch
git checkout main

# Create and switch to new branch
git checkout -b hotfix

# Merge a branch into current branch
git merge new-feature

# Add a remote repository
git remote add origin https://github.com/user/repo.git

# View remote repositories
git remote -v

# Push local commits to remote
git push

# Push and set upstream for the first time
git push -u origin main

# Pull from remote and merge
git pull

# Undo all local changes (WARNING: irreversible)
git reset --hard HEAD

# Unstage a file
git reset filename.txt

# Revert a specific commit
git revert COMMIT_ID

# Amend the last commit
git commit --amend

# Remove untracked files
git clean -f

# Remove untracked files and directories
git clean -fd
