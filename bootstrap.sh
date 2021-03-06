#!/bin/sh

# macOS High Sierra Bootstrap

# Exit immediately if a command exits with a non-zero status
set -e

# Update the user's cached credentials, authenticating the user if necessary
sudo -v

# Store a local variable of the scripts current directory
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

echo "==> Install macOS tweaks? (Y/n)"
read USER_PROMPT
if [[ "$USER_PROMPT" == 'y' ]] || [[ "$USER_PROMPT" == '' ]]; then
    ${DIR}/macos-tweaks.sh
else
    echo "==> Skip installing macOS tweaks."
fi

echo "==> Install user applications? (Y/n)"
read USER_PROMPT
if [[ "$USER_PROMPT" == 'y' ]] || [[ "$USER_PROMPT" == '' ]]; then
    ${DIR}/gui-applications.sh
else
    echo "==> Skip installing user applications."
fi

echo "==> Install development utilities? (Y/n)"
read USER_PROMPT
if [[ "$USER_PROMPT" == 'y' ]] || [[ "$USER_PROMPT" == '' ]]; then
    ${DIR}/development-utils.sh
else
    echo "==> Skip installing development utilities."
fi

echo "==> Bootstrap complete."
