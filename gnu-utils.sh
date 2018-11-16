#!/bin/sh

# Install Updated GNU Utilities

# Exit immediately if a command exits with a non-zero status
set -e

# Update the user's cached credentials, authenticating the user if necessary
sudo -v

if ! command -v brew >/dev/null 2>&1 ; then
    echo '==> Homebrew not found. Installing now...'
    ./brew.sh
fi

if command -v 'brew' >/dev/null 2>&1 ; then
    echo '==> Installing updated GNU utilities...'

    # Install current version of bash
    brew install bash

    # Install GNU versions of command line utils
    brew install grep --with-default-names
    brew install gnu-sed --with-default-names
    brew install moreutils
else
    echo '==> Homebrew not found. Aborting...'
    exit 1
fi
