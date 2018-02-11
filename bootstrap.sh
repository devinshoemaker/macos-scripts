#!/bin/sh

# macOS High Sierra Bootstrap

# Get Super User Privilege
sudo -v

# macOS Updates
echo '==> Install macOS updates? (Y/n)'
read INSTALL_MACOS_UPDATES
if [ "$INSTALL_MACOS_UPDATES" == 'y' ] || [ "$INSTALL_MACOS_UPDATES" == 'yes' ] || [ "$INSTALL_MACOS_UPDATES" == '' ]; then
    echo "==> Updating macOS"
    softwareupdate -l
    softwareupdate -i -a
else
    echo '==> Skipping macOS updates.'
fi

echo '==> Install Homebrew? (Y/n)'
read INSTALL_HOMEBREW
if [ "$INSTALL_HOMEBREW" = 'y' ] || [ "$INSTALL_HOMEBREW" = 'yes' ] || [ "$INSTALL_HOMEBREW" = '' ]; then
    # Install Homebrew
    /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
else
    echo '==> Skipping Homebrew.'
fi

echo '==> Install Homebrew Caskroom? (Y/n)'
read INSTALL_HOMEBREW_CASK
if [ "$INSTALL_HOMEBREW_CASK" = 'y' ] || [ "$INSTALL_HOMEBREW_CASK" = 'yes' ] || [ "$INSTALL_HOMEBREW_CASK" = '' ]; then
    # Homebrew Cask
    brew tap caskroom/cask
    brew tap caskroom/versions
else
    echo '==> Skipping Homebrew Cask.'
fi

echo '==> Install Java 8? (Y/n)'
read INSTALL_JAVA
if [ "$INSTALL_JAVA" = 'y' ] || [ "$INSTALL_JAVA" = 'yes' ] || [ "$INSTALL_JAVA" = '' ]; then
    brew cask install java8
else
    echo '==> Skipping Java 8.'
fi

echo '==> Install Cask applications? (Y/n)'
read INSTALL_CASK_APPLICATIONS
if [ "$INSTALL_CASK_APPLICATIONS" = 'y' ] || [ "$INSTALL_CASK_APPLICATIONS" = 'yes' ] || [ "$INSTALL_CASK_APPLICATIONS" = '' ]; then
    brew cask install android-file-transfer firefox google-chrome marshallofsound-google-play-music-player moom slack spectacle transmission vlc
else
    echo '==> Skipping Cask applications.'
fi

echo '==> Install development packages? (Y/n)'
read INSTALL_DEVELOPMENT_PACKAGES
if [ "$INSTALL_DEVELOPMENT_PACKAGES" = 'y' ] || [ "$INSTALL_DEVELOPMENT_PACKAGES" = 'yes' ] || [ "$INSTALL_DEVELOPMENT_PACKAGES" = '' ]; then
    brew cask install docker gitkraken intellij-idea iterm2 postman visual-studio-code
else
    echo '==> Skipping development packages.'
fi
