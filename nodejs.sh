#!/bin/sh

# macOS - Install Node.js

. brew.sh

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
fi
