#!/bin/sh

# Install updated GNU utils

# Check if Homebrew is installed
if ! command -v brew >/dev/null 2>&1 ; then
    brew.sh
fi

echo '==> Installing updated GNU utils...'

# Install current version of bash
brew install bash

# Install GNU versions of command line utils
brew install grep --with-default-names
brew install gnu-sed --with-default-names
