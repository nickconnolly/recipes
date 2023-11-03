#!/bin/bash

# Function to check if a command was successful
check_status() {
  if [ $? -ne 0 ]; then
    echo "Error during $1. Exiting."
    exit 1
  fi
}

# Add autopkg repo
echo "Adding autopkg repo..."
autopkg repo-add grahampugh-recipes
check_status "autopkg repo-add"

# Install Rosetta
echo "Installing Rosetta..."
softwareupdate --install-rosetta --agree-to-license
check_status "Rosetta installation"

# Install Xcode Command Line Tools
echo "Installing Xcode Command Line Tools..."
xcode-select --install
check_status "Xcode Command Line Tools installation"

echo "All tasks completed successfully."
