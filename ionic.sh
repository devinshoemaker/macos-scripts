#!/bin/sh

# macOS - Install Ionic

if ! command -v 'npm' >/dev/null 2>&1 ; then
    echo '==> NPM not installed. Installing Node.js now...'
    ./nodejs.sh
fi

if command -v 'npm' >/dev/null 2>&1 ; then
    echo '==> Installing Angular CLI...'
    npm install -g ionic cordova
else
    echo '==> NPM not installed. Aborting...'
    exit 1
fi
