#!/bin/sh

# macOS Tweaks

# Exit immediately if a command exits with a non-zero status
set -e

echo '==> Tweaking macOS settings...'

###############################################################################
# General                                                                     #
###############################################################################
# Always show scrollbars
defaults write NSGlobalDomain AppleShowScrollBars -string "Always"

# Disable automatic capitalization as it’s annoying when typing code
defaults write NSGlobalDomain NSAutomaticCapitalizationEnabled -bool false

# Disable smart dashes as they’re annoying when typing code
defaults write NSGlobalDomain NSAutomaticDashSubstitutionEnabled -bool false

# Disable automatic period substitution as it’s annoying when typing code
defaults write NSGlobalDomain NSAutomaticPeriodSubstitutionEnabled -bool false

# Disable smart quotes as they’re annoying when typing code
defaults write NSGlobalDomain NSAutomaticQuoteSubstitutionEnabled -bool false

# Disable auto-correct
defaults write NSGlobalDomain NSAutomaticSpellingCorrectionEnabled -bool false

# Enable dark theme
defaults write NSGlobalDomain AppleInterfaceStyle Dark

###############################################################################
# Input                                                                       #
###############################################################################
# Disable natural scrolling
defaults write NSGlobalDomain com.apple.swipescrolldirection -bool false

###############################################################################
# Finder                                                                      #
###############################################################################
# Set Home as the default location for new Finder windows
# For other paths, use `PfDe` and `file://${HOME}/Desktop/`
defaults write com.apple.finder NewWindowTarget -string "PfLo"
defaults write com.apple.finder NewWindowTargetPath -string "file://${HOME}/"

# Show status bar
defaults write com.apple.finder ShowStatusBar -bool true

# Show path bar
defaults write com.apple.finder ShowPathbar -bool true

# Keep folders on top when sorting by name
defaults write com.apple.finder _FXSortFoldersFirst -bool true

# When performing a search, search the current folder by default
defaults write com.apple.finder FXDefaultSearchScope -string "SCcf"

# Disable the warning when changing a file extension
defaults write com.apple.finder FXEnableExtensionChangeWarning -bool false

# Avoid creating .DS_Store files on network or USB volumes
defaults write com.apple.desktopservices DSDontWriteNetworkStores -bool true
defaults write com.apple.desktopservices DSDontWriteUSBStores -bool true

###############################################################################
# Dock                                                                        #
###############################################################################
# Automatically hide and show the Dock
defaults write com.apple.dock autohide -bool true

###############################################################################
# Kill affected applications                                                  #
###############################################################################
for app in "Dock" \
	"Finder"; do
	killall "${app}" &> /dev/null
done

echo '==> Done tweaking macOS settings'
