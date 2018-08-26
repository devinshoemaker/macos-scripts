#!/bin/sh

# Install Ionic

# Exit immediately if a command exits with a non-zero status
set -e

# Update the user's cached credentials, authenticating the user if necessary
sudo -v

if ! command -v 'npm' >/dev/null 2>&1 ; then
    echo '==> NPM not installed. Installing Node.js now...'
    ./nodejs.sh
fi

if command -v 'npm' >/dev/null 2>&1 ; then
    echo '==> Installing Ionic CLI...'
    npm install -g ionic cordova
else
    echo '==> NPM not installed. Aborting...'
    exit 1
fi
