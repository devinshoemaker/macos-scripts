#!/bin/sh

# Clone Ionic Projects

# Exit immediately if a command exits with a non-zero status
set -e

# Update the user's cached credentials, authenticating the user if necessary
sudo -v

# Store a local variable of the scripts current directory
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

if ! command -v "brew" > /dev/null 2>&1; then
    echo "==> Homebrew not found. Installing now..."
    ${DIR}/brew.sh
fi

if command -v "brew" > /dev/null 2>&1; then
    echo "==> Installing CouchDB..."
    brew install couchdb
    brew services start couchdb
    echo "==> CouchDB installed."

    echo "==> Adding CORS to CouchDB..."
    npm install -g add-cors-to-couchdb
    add-cors-to-couchdb
    echo "==> CORS added to CouchDB."

    if ! command -v "git" > /dev/null 2>&1; then
        echo "==> Installing Git..."
        brew install git
        echo "==> Git installed."
    fi

    if command -v "git" > /dev/null 2>&1; then
        echo "==> Cloning Ionic projects..."

        # Create Source Code Directory
        mkdir -p ~/code/ionic
        cd ~/code/ionic

        # Clone Ionic Projects
        git clone https://github.com/dshoe/taskit-ionic.git
        git clone https://github.com/dshoe/CryptoProfitLog.git
        git clone https://github.com/dshoe/DaysSince.git
        git clone https://github.com/dshoe/WaterWatch.git

        echo "==> Ionic projects cloned."
    else
        echo "==> Git not found. Aborting..."
        exit 1
    fi
else
    echo "==> Homebrew not found. Aborting..."
    exit 1
fi
