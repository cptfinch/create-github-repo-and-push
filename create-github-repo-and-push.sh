#!/bin/bash

# Check if gh is installed
if ! command -v gh &> /dev/null
then
    echo "GitHub CLI (gh) could not be found. Please install it first."
    exit
fi

# Check if git is installed
if ! command -v git &> /dev/null
then
    echo "Git could not be found. Please install it first."
    exit
fi

# Function to display usage
usage() {
    echo "Usage: $0 <repo-name> <private|public>"
    exit 1
}

# Check if the correct number of arguments is provided
if [ $# -ne 2 ]; then
    usage
fi

REPO_NAME=$1
REPO_VISIBILITY=$2

# Validate visibility argument
if [[ "$REPO_VISIBILITY" != "private" && "$REPO_VISIBILITY" != "public" ]]; then
    echo "Visibility must be 'private' or 'public'."
    usage
fi

# Create a new repository on GitHub
gh repo create "$REPO_NAME" --"$REPO_VISIBILITY" --source=. --remote=origin

# Check if the repository was created successfully
if [ $? -ne 0 ]; then
    echo "Failed to create the repository on GitHub."
    exit 1
fi

# Initialize git (if not already initialized)
if [ ! -d .git ]; then
    git init
fi

# Add all files to the staging area
git add .

# Commit the changes
git commit -m "Initial commit"

# Push the local repository to GitHub
git push -u origin main

echo "Repository '$REPO_NAME' created and pushed to GitHub successfully."

