#!/bin/sh

# Install Development Utilities

# Exit immediately if a command exits with a non-zero status
set -e

# Update the user's cached credentials, authenticating the user if necessary
sudo -v

# Store a local variable of the scripts current directory
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

echo "==> Install Xcode command line tools? (Y/n)"
read USER_PROMPT
if [[ "$USER_PROMPT" = 'y' ]] || [[ "$USER_PROMPT" = '' ]]; then
    echo "==> Installing Xcode command line tools..."
    xcode-select --install
    sudo xcode-select -s /Applications/Xcode.app/Contents/Developer
    echo "==> Xcode command line tools installed."
else
    echo "==> Skip installing Xcode command line tools."
fi

echo "==> Install CocoaPods? (Y/n)"
read USER_PROMPT
if [[ "$USER_PROMPT" = 'y' ]] || [[ "$USER_PROMPT" = '' ]]; then
    echo "==> Installing CocoaPods..."
    sudo gem install cocoapods
    echo "==> CocoaPods installed."
else
    echo "==> Skip installing CocoaPods."
fi

if ! command -v "brew" > /dev/null 2>&1; then
    echo "==> Install Homebrew? (Y/n)"
    read USER_PROMPT
    if [[ "$USER_PROMPT" = 'y' ]] || [[ "$USER_PROMPT" = '' ]]; then
        ${DIR}/brew.sh
    else
        echo "==> Skip installing Homebrew."
    fi
fi

echo "==> Install updated GNU utilities? (Y/n)"
read USER_PROMPT
if [[ "$USER_PROMPT" = 'y' ]] || [[ "$USER_PROMPT" = '' ]]; then
    ${DIR}/gnu-utils.sh
else
    echo "==> Skip installing updated GNU utilities."
fi

echo "==> Install development applications? (Y/n)"
read USER_PROMPT
if [[ "$USER_PROMPT" = 'y' ]] || [[ "$USER_PROMPT" = '' ]]; then
    echo "==> Installing development applications..."
    brew install git

    brew cask install \
    docker \
    gitkraken \
    intellij-idea \
    iterm2 \
    postman \
    visual-studio-code
else
    echo "==> Skip installing development applications."
fi

if ! command -v "node" > /dev/null 2>&1; then
    echo "==> Install Node.js? (Y/n)"
    read USER_PROMPT
    if [[ "$USER_PROMPT" = 'y' ]] || [[ "$USER_PROMPT" = '' ]]; then
        ${DIR}/nodejs.sh
    else
        echo "==> Skip installing Node.js."
    fi
fi

if ! command -v "ionic" > /dev/null 2>&1; then
    echo "==> Install Ionic? (Y/n)"
    read USER_PROMPT
    if [[ "$USER_PROMPT" = 'y' ]] || [[ "$USER_PROMPT" = '' ]]; then
        ${DIR}/ionic.sh

        echo "==> Clone Ionic projects? (Y/n)"
        read USER_PROMPT
        if [[ "$USER_PROMPT" = 'y' ]] || [[ "$USER_PROMPT" = '' ]]; then
            ${DIR}/ionic-projects.sh
        else
            echo "==> Skip cloning Ionic projects."
        fi
    else
        echo "==> Skip installing Ionic CLI."
    fi
fi

if ! command -v "ng" > /dev/null 2>&1; then
    echo "==> Install Angular? (Y/n)"
    read USER_PROMPT
    if [[ "$USER_PROMPT" = 'y' ]] || [[ "$USER_PROMPT" = '' ]]; then
        ${DIR}/angular.sh

        # echo "==> Clone Angular projects? (Y/n)"
        # read USER_PROMPT
        # if [[ "$USER_PROMPT" = 'y' ]] || [[ "$USER_PROMPT" = '' ]]; then
        #     ${DIR}/angular-projects.sh
        # else
        #     echo "==> Skip cloning Angular projects."
        # fi
    else
        echo "==> Skip installing Angular CLI."
    fi
fi

echo "==> Install Java 8? (Y/n)"
read USER_PROMPT
if [[ "$USER_PROMPT" = 'y' ]] || [[ "$USER_PROMPT" = 'yes' ]] || [[ "$USER_PROMPT" = '' ]]; then
    ${DIR}/java8.sh
else
    echo "==> Skip installing Java 8."
fi

echo "==> Install Android development environment? (Y/n)"
read USER_PROMPT
if [[ "$USER_PROMPT" = 'y' ]] || [[ "$USER_PROMPT" = '' ]]; then
    ${DIR}/android-development.sh
else
    echo "==> Skip installing Android development environment."
fi

echo "==> Development utilities installed."
