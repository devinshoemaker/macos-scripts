#!/bin/sh

# Install Ionic

# Exit immediately if a command exits with a non-zero status
set -e

# Update the user's cached credentials, authenticating the user if necessary
sudo -v

# Store a local variable of the scripts current directory
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

if ! command -v "npm" > /dev/null 2>&1; then
    echo "==> NPM not installed. Installing Node.js now..."
    ${DIV}/nodejs.sh
fi

if command -v "npm" > /dev/null 2>&1; then
    echo "==> Installing Ionic CLI..."
    npm install -g ionic
    echo "==> Ionic CLI installed."
else
    echo "==> NPM not installed. Aborting..."
    exit 1
fi
