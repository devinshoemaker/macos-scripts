#!/bin/sh

# User Applications

# Exit immediately if a command exits with a non-zero status
set -e

# Update the user's cached credentials, authenticating the user if necessary
sudo -v

# Store a local variable of the scripts current directory
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

if ! command -v "brew" > /dev/null 2>&1; then
    echo "==> Homebrew not found. Installing now..."
    ${DIR}/brew.sh
fi

if command -v "brew" > /dev/null 2>&1; then
    echo "==> Installing user applications..."

    brew cask install \
    alfred \
    android-file-transfer \
    firefox \
    keka \
    plex-media-server \
    pocket-casts \
    slack \
    spotify \
    telegram-desktop \
    transmission \
    vlc \

    echo "==> User applications installed."
else
    echo "==> Homebrew not found. Aborting..."
    exit 1
fi
