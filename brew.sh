#!/bin/sh

# Install Homebrew

# Exit immediately if a command exits with a non-zero status
set -e

echo "==> Installing Homebrew..."
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
echo "==> Homebrew installed."
