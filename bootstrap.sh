#!/bin/sh

# macOS High Sierra Bootstrap

# Exit immediately if a command exits with a non-zero status
set -e

# Update the user's cached credentials, authenticating the user if necessary
sudo -v

echo '==> Install macOS updates? (Y/n)'
read USER_PROMPT
if [ "$USER_PROMPT" == 'y' ] || [ "$USER_PROMPT" == '' ]; then
    echo "==> Updating macOS..."
    softwareupdate -l
    softwareupdate -i -a
else
    echo '==> Skipping macOS updates'
fi

echo '==> Install macOS tweaks? (Y/n)'
read USER_PROMPT
if [ "$USER_PROMPT" == 'y' ] || [ "$USER_PROMPT" == '' ]; then
    ./macos-tweaks.sh
else
    echo '==> Skipping macOS tweaks'
fi

echo '==> Install user applications? (Y/n)'
read USER_PROMPT
if [ "$USER_PROMPT" == 'y' ] || [ "$USER_PROMPT" == '' ]; then
    ./user-applications.sh
else
    echo '==> Skipping user applications'
fi

echo '==> Install development utilities? (Y/n)'
read USER_PROMPT
if [ "$USER_PROMPT" == 'y' ] || [ "$USER_PROMPT" == '' ]; then
    ./development-utils.sh
else
    echo '==> Skipping development utilities'
fi
