#!/bin/sh

# User Applications

# Exit immediately if a command exits with a non-zero status
set -e

# Update the user's cached credentials, authenticating the user if necessary
sudo -v

if ! command -v 'brew' >/dev/null 2>&1 ; then
    echo '==> Homebrew not found. Installing now...'
    ./brew.sh
fi

if command -v 'brew' >/dev/null 2>&1 ; then
    echo '==> Installing user applications...'
    brew cask install alfred android-file-transfer clover-configurator eqmac firefox google-chrome keka slack spotify telegram-desktop transmission vlc
else
    echo '==> Homebrew not found. Aborting...'
    exit 1
fi
