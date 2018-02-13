#!/bin/sh

# macOS - Clone Ionic Projects

# Check if Homebrew is installed
./brew.sh

# Install CouchDB
brew install couchdb
brew services start couchdb

# Add CORS to CouchDB
npm install -g add-cors-to-couchdb
add-cors-to-couchdb

# Create Source Code Directory
mkdir -p ~/code/ionic
cd ~/code/ionic

# Clone Ionic Projects
git clone https://github.com/dshoe/taskit-ionic.git
git clone https://github.com/dshoe/CryptoProfitLog.git
git clone https://github.com/dshoe/DaysSince.git
git clone https://github.com/dshoe/WaterWatch.git
