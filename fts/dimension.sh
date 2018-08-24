#!/bin/sh

echo '==> Checking if Homebrew is installed...'
which -s brew
if [[ $? != 0 ]] ; then
    # Install Homebrew
    echo '==> Homebrew not found, install Homebrew? (Y/n)'
    read INSTALL_HOMEBREW
    if [ "$INSTALL_HOMEBREW" = 'y' ] || [ "$INSTALL_HOMEBREW" = 'yes' ] || [ "$INSTALL_HOMEBREW" = '' ]; then
        # Install Homebrew
        /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
    else
        echo '==> Skipping Homebrew'
    fi
else
    echo '==> Homebrew found, updating packages'
    brew update
fi

echo '==> Installing required Homebrew packages'
brew install maven nvm tomcat

echo '==> Installing Node.js...'
nvm install --lts=Boron

echo '==> Installing required NPM packages...'
npm install -g bower gulp nodemon

mkdir -p ~/code/fts
cd ~/code/fts

git clone git@github.com:sporting-innovations/fan360-dimension.git
git clone git@github.com:sporting-innovations/si-dimension.git
