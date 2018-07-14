#!/bin/sh

# macOS High Sierra Bootstrap

# Exit immediately if a command exits with a non-zero status
set -e

# macOS Updates
echo '==> Install macOS updates? (Y/n)'
read USER_PROMPT
if [ "$USER_PROMPT" == 'y' ] || [ "$USER_PROMPT" == '' ]; then
    echo "==> Updating macOS"
    softwareupdate -l
    softwareupdate -i -a
else
    echo '==> Skipping macOS updates.'
fi

echo '==> Checking if Homebrew is installed...'
if ! [ command -v 'brew' >/dev/null 2>&1 ] ; then
    # Install Homebrew
    echo '==> Homebrew not found, install Homebrew? (Y/n)'
    read USER_PROMPT
    if [ "$USER_PROMPT" = 'y' ] || [ "$USER_PROMPT" = '' ]; then
        # Install Homebrew
        /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
    else
        echo '==> Skipping Homebrew.'
    fi
fi

if ! [ command -v 'brew' >/dev/null 2>&1 ] ; then
    echo '==> Install Homebrew Caskroom? (Y/n)'
    read USER_PROMPT
    if [ "$USER_PROMPT" = 'y' ] || [ "$USER_PROMPT" = '' ]; then
        # Homebrew Cask
        brew tap caskroom/cask
        brew tap caskroom/versions
    else
        echo '==> Skipping Homebrew Cask.'
    fi

    echo '==> Install Java 8? (Y/n)'
    read USER_PROMPT
    if [ "$USER_PROMPT" = 'y' ] || [ "$USER_PROMPT" = 'yes' ] || [ "$USER_PROMPT" = '' ]; then
        brew cask install java8
    else
        echo '==> Skipping Java 8.'
    fi

    echo '==> Install Cask applications? (Y/n)'
    read USER_PROMPT
    if [ "$USER_PROMPT" = 'y' ] || [ "$USER_PROMPT" = '' ]; then
        brew cask install android-file-transfer eqmac firefox google-chrome marshallofsound-google-play-music-player moom slack spectacle transmission vlc
    else
        echo '==> Skipping Cask applications.'
    fi

    echo '==> Install development packages? (Y/n)'
    read USER_PROMPT
    if [ "$USER_PROMPT" = 'y' ] || [ "$USER_PROMPT" = '' ]; then
        brew cask install docker gitkraken intellij-idea iterm2 postman visual-studio-code
    else
        echo '==> Skipping development packages.'
    fi
fi

echo '==> Install Node.js? (Y/n)'
read USER_PROMPT
if [ "$USER_PROMPT" = 'y' ] || [ "$USER_PROMPT" = '' ]; then
    ./nodejs.sh
else
    echo '==> Skipping Node.js.'
fi
