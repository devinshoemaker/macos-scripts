#!/bin/sh

# Configure Oh My Zsh plugins

# Exit immediately if a command exits with a non-zero status
set -e

# Store a local variable of the scripts current directory
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

if [[ -f "~/.zshrc" ]]; then
    sed -i -e 's/plugins=(git)/plugins=(git mvn nvm z)/g' ~/.zshrc
else
    echo "==> .zshrc not found, Oh My Zsh possibly not installed. Aborting."
    exit 1
fi
