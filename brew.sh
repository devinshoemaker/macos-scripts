#!/bin/sh

# Install Homebrew on macOS

if ! command -v brew >/dev/null 2>&1 ; then
    echo '==> Homebrew not found, install Homebrew? (Y/n)'
    read USER_PROMPT
    if [ "$USER_PROMPT" = 'y' ] || [ "$USER_PROMPT" = '' ]; then
        /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
    else
        echo '==> Skipping Homebrew.'
    fi
fi
