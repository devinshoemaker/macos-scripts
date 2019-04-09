#!/bin/sh

# Install Updated GNU Utilities

# Exit immediately if a command exits with a non-zero status
set -e

# Update the user's cached credentials, authenticating the user if necessary
sudo -v

# Store a local variable of the scripts current directory
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

if ! command -v "brew" > /dev/null 2>&1; then
    echo "==> Homebrew not found. Installing now..."
    ${DIV}/brew.sh
fi

if command -v "brew" > /dev/null 2>&1; then
    echo "==> Installing updated GNU utilities..."

    # Install current version of bash
    brew install bash

    # Install GNU versions of command line utils
    brew install grep --with-default-names
    brew install gnu-sed --with-default-names
    brew install moreutils

    echo "==> Updated GNU utilities installed."
else
    echo "==> Homebrew not found. Aborting..."
    exit 1
fi
