#!/bin/sh

# Android Development Environment

# Exit immediately if a command exits with a non-zero status
set -e

# Store a local variable of the scripts current directory
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

if ! command -v "brew" > /dev/null 2>&1; then
    echo "==> Homebrew not found. Installing now..."
    ${DIR}/brew.sh
fi

if command -v "brew" > /dev/null 2>&1; then
    echo "==> Installing Android development environment..."

    brew cask install android-studio

    echo "export PATH=$PATH:$HOME/Library/Android/sdk/platform-tools/" >> ~/.bash_profile
    echo "export PATH=$PATH:$HOME/Library/Android/sdk/tools/" >> ~/.bash_profile
    echo "\n" >> ~/.bash_profile

    echo "export PATH=$PATH:$HOME/Library/Android/sdk/platform-tools/" >> ~/.zshenv
    echo "export PATH=$PATH:$HOME/Library/Android/sdk/tools/" >> ~/.zshenv
    echo "\n" >> ~/.zshenv
    
    echo "==> Android development environment installed."
else
    echo "==> Homebrew not found. Aborting..."
    exit 1
fi
