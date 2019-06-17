#!/bin/sh

# Install Java 8

# Exit immediately if a command exits with a non-zero status
set -e

# Store a local variable of the scripts current directory
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

if ! command -v "brew" > /dev/null 2>&1; then
    echo "==> Homebrew not found. Installing now..."
    ${DIV}/brew.sh
fi

if command -v "brew" > /dev/null 2>&1; then
    echo "==> Tapping OpenJDK..."
    brew tap adoptopenjdk/openjdk
    echo "==> OpenJDK tapped."

    echo "==> Installing OpenJDK 8..."
    brew cask install adoptopenjdk8
    echo "==> OpenJDK 8 installed."
fi