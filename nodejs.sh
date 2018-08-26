#!/bin/sh

# Install Node.js

# Exit immediately if a command exits with a non-zero status
set -e

# Update the user's cached credentials, authenticating the user if necessary
sudo -v

if ! command -v brew >/dev/null 2>&1 ; then
    echo '==> Homebrew not found. Installing now...'
    ./brew.sh
fi

if command -v 'brew' >/dev/null 2>&1 ; then
    # Install Node Version Manager
    brew install nvm

    # Allow NVM without restarting
    export NVM_DIR="$HOME/.nvm"
    . "/usr/local/opt/nvm/nvm.sh"

    echo 'export NVM_DIR="$HOME/.nvm"' >> ~/.bash_profile
    echo '. "/usr/local/opt/nvm/nvm.sh"' >> ~/.bash_profile

    # Install latest Node.js with NVM
    nvm install --lts
else
    echo '==> Homebrew not found. Aborting...'
    exit 1
fi
