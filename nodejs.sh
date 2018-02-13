#!/bin/sh

# macOS - Install Node.js

echo '==> Checking if Homebrew is installed...'
which -s brew
if [[ $? != 0 ]] ; then
    # Install Homebrew
    echo '==> Homebrew not found, installing now.'
    ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
else
    echo '==> Homebrew found, updating packages.'
    brew update
fi

# Install Node Version Manager
brew install nvm

# Allow NVM without restarting
export NVM_DIR="$HOME/.nvm"
. "/usr/local/opt/nvm/nvm.sh"

echo 'export NVM_DIR="$HOME/.nvm"' >> ~/.bash_profile
echo '. "/usr/local/opt/nvm/nvm.sh"' >> ~/.bash_profile

# Install latest Node.js with NVM
nvm install node
