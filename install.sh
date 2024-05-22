#!/bin/bash

# Define the target directory
TARGET_DIR="/usr/local/bin"

# Define the URL to the raw script file on GitHub
SCRIPT_URL="https://raw.githubusercontent.com/your-username/your-repo/main/create_and_push_repo.sh"

# Define the script name
SCRIPT_NAME="create_and_push_repo"

# Download the script
curl -o $SCRIPT_NAME $SCRIPT_URL

# Make the script executable
chmod +x $SCRIPT_NAME

# Move the script to the target directory
sudo mv $SCRIPT_NAME $TARGET_DIR

# Check if the script is in the PATH and installed correctly
if command -v $SCRIPT_NAME &> /dev/null
then
    echo "$SCRIPT_NAME installed successfully!"
else
    echo "Failed to install $SCRIPT_NAME. Please check your PATH."
fi

