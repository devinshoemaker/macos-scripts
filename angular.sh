#!/bin/sh

# Install Angular

# Exit immediately if a command exits with a non-zero status
set -e

# Store a local variable of the scripts current directory
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

if ! command -v "npm" > /dev/null 2>&1; then
    echo "==> NPM not installed. Installing Node.js now..."
    ${DIR}/nodejs.sh
fi

if command -v "npm" > /dev/null 2>&1; then
    echo "==> Installing Angular CLI..."
    npm install -g @angular/cli
    echo "==> Angular CLI installed."
else
    echo "==> NPM not installed. Aborting..."
    exit 1
fi
