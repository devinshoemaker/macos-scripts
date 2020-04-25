#!/bin/sh

# Install Node.js

# Don't exit immediately if a command exits with a non-zero status
# This causes the script to stop after executing `nvm.sh`
# set -e

# Update the user's cached credentials, authenticating the user if necessary
sudo -v

# Store a local variable of the scripts current directory
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

echo "==> Installing Node Version Manager..."

# Install Node Version Manager
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.35.3/install.sh | bash

# Allow NVM without restarting
export NVM_DIR="$HOME/.nvm"
[ -s "/usr/local/opt/nvm/nvm.sh" ] && . "/usr/local/opt/nvm/nvm.sh"  # This loads nvm
[ -s "/usr/local/opt/nvm/etc/bash_completion" ] && . "/usr/local/opt/nvm/etc/bash_completion"  # This loads nvm bash_completion

echo "==> Node Version Manager installed."

# Install latest Node.js with NVM
echo "==> Installing latest Node.js LTS..."
nvm install --lts
echo "==> Latest Node.js LTS installed."
