#!/bin/sh

# Install Homebrew on macOS

echo '==> Checking if Homebrew is installed...'
which -s brew
if [[ $? != 0 ]] ; then
    # Install Homebrew
    echo '==> Homebrew not found, installing now.'
    ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
else
    echo '==> Homebrew found, updating packages.'
    brew update
fi
