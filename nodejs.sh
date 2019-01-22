#!/bin/sh

# Install Node.js

# Don't exit immediately if a command exits with a non-zero status
# This causes the script to stop after executing `nvm.sh`
# set -e

# Update the user's cached credentials, authenticating the user if necessary
sudo -v

if ! command -v brew >/dev/null 2>&1 ; then
    echo '==> Homebrew not found. Installing now...'
    ./brew.sh
fi

if command -v 'brew' >/dev/null 2>&1 ; then
    # Install Node Version Manager
    echo "==> Installing NVM..."
    brew install nvm

    # Allow NVM without restarting
    source $(brew --prefix nvm)/nvm.sh

    # Allow NVM after restarting
    echo 'source $(brew --prefix nvm)/nvm.sh' >> ~/.profile

    echo "==> NVM installed."

    # Install latest Node.js with NVM
    echo "==> Installing latest Node.js LTS..."
    nvm install --lts
    echo "==> Latest Node.js LTS installed."
else
    echo '==> Homebrew not found. Aborting...'
    exit 1
fi
