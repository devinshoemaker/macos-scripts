#!/bin/sh

# Install Development Utilities

# Exit immediately if a command exits with a non-zero status
set -e

# Update the user's cached credentials, authenticating the user if necessary
sudo -v

echo '==> Install Xcode command line tools? (Y/n)'
read USER_PROMPT
if [ "$USER_PROMPT" = 'y' ] || [ "$USER_PROMPT" = '' ]; then
    echo '==> Installing Xcode command line tools...'
    xcode-select --install
    sudo xcode-select -s /Applications/Xcode.app/Contents/Developer
else
    echo '==> Skipping Xcode command line tools'
fi

echo '==> Install CocoaPods? (Y/n)'
read USER_PROMPT
if [ "$USER_PROMPT" = 'y' ] || [ "$USER_PROMPT" = '' ]; then
    echo '==> Installing CocoaPods...'
    sudo gem install cocoapods
else
    echo '==> Skipping CocoaPods'
fi

if ! command -v 'brew' >/dev/null 2>&1 ; then
    echo '==> Install Homebrew? (Y/n)'
    read USER_PROMPT
    if [ "$USER_PROMPT" = 'y' ] || [ "$USER_PROMPT" = '' ]; then
        ./brew.sh
    else
        echo '==> Skipping Homebrew'
    fi
fi

echo '==> Tap Homebrew Caskroom? (Y/n)'
read USER_PROMPT
if [ "$USER_PROMPT" = 'y' ] || [ "$USER_PROMPT" = '' ]; then
    echo '==> Tapping Homebrew Caskroom...'

    brew tap caskroom/cask
    brew tap caskroom/versions
else
    echo '==> Skipping Homebrew Cask'
fi

echo '==> Install updated GNU utilities? (Y/n)'
read USER_PROMPT
if [ "$USER_PROMPT" = 'y' ] || [ "$USER_PROMPT" = '' ]; then
    ./gnu-utils.sh
else
    echo '==> Skipping updated GNU utilities'
fi

echo '==> Install development applications? (Y/n)'
read USER_PROMPT
if [ "$USER_PROMPT" = 'y' ] || [ "$USER_PROMPT" = '' ]; then
    echo '==> Installing development applications...'
    brew install git
    brew cask install docker gitkraken intellij-idea iterm2 postman visual-studio-code
else
    echo '==> Skipping development applications'
fi

echo '==> Install Node.js? (Y/n)'
read USER_PROMPT
if [ "$USER_PROMPT" = 'y' ] || [ "$USER_PROMPT" = '' ]; then
    ./nodejs.sh
else
    echo '==> Skipping Node.js'
fi

echo '==> Install Ionic? (Y/n)'
read USER_PROMPT
if [ "$USER_PROMPT" = 'y' ] || [ "$USER_PROMPT" = '' ]; then
    ./ionic.sh

    echo '==> Clone Ionic projects? (Y/n)'
    read USER_PROMPT
    if [ "$USER_PROMPT" = 'y' ] || [ "$USER_PROMPT" = '' ]; then
        ./ionic-projects.sh
    else
        echo '==> Skipping Ionic projects'
    fi
else
    echo '==> Skipping Ionic'
fi

echo '==> Install Angular? (Y/n)'
read USER_PROMPT
if [ "$USER_PROMPT" = 'y' ] || [ "$USER_PROMPT" = '' ]; then
    ./angular.sh

    # echo '==> Clone Angular projects? (Y/n)'
    # read USER_PROMPT
    # if [ "$USER_PROMPT" = 'y' ] || [ "$USER_PROMPT" = '' ]; then
    #     ./angular-projects.sh
    # else
    #     echo '==> Skipping Angular projects'
    # fi
else
    echo '==> Skipping Angular'
fi

echo '==> Install Java 8? (Y/n)'
read USER_PROMPT
if [ "$USER_PROMPT" = 'y' ] || [ "$USER_PROMPT" = 'yes' ] || [ "$USER_PROMPT" = '' ]; then
    if ! command -v 'brew' >/dev/null 2>&1 ; then
        echo '==> Homebrew not found. Installing now...'
        ./brew.sh
    fi

    if command -v 'brew' >/dev/null 2>&1 ; then
        echo '==> Installing Java 8...'
        brew cask install java8
    else
        echo '==> Homebrew not found. Aborting...'
        exit 1
    fi
else
    echo '==> Skipping Java 8'
fi

echo '==> Install Android development environment? (Y/n)'
read USER_PROMPT
if [ "$USER_PROMPT" = 'y' ] || [ "$USER_PROMPT" = '' ]; then
    ./android-development.sh
else
    echo '==> Skipping Android development environment'
fi
