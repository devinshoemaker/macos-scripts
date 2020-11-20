#!/bin/sh

# Install updated ZSH and Oh My Zsh

# Exit immediately if a command exits with a non-zero status
set -e

# Store a local variable of the scripts current directory
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

if ! command -v "brew" > /dev/null 2>&1; then
    echo "==> Homebrew not found. Installing now..."
    ${DIR}/brew.sh
fi

if command -v "brew" > /dev/null 2>&1; then
    echo "==> Installing updated ZSH..."
    brew install zsh zsh-completions
    echo "==> Updated ZSH installed."

    echo 'export EDITOR=nano' >> ~/.zshenv
    echo "\n" >> ~/.zshenv

    echo "==> Installing Oh My Zsh..."
    sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
fi
