#!/bin/sh

# Install Homebrew

# Exit immediately if a command exits with a non-zero status
set -e

echo "==> Installing Homebrew..."
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"
echo "==> Homebrew installed."
