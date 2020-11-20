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
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.37.0/install.sh | bash

# Allow NVM without restarting
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm

echo "==> Node Version Manager installed."

# Install latest Node.js with NVM
echo "==> Installing latest Node.js LTS..."
nvm install --lts
echo "==> Latest Node.js LTS installed."
