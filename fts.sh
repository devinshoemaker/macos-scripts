# Install FTS Packages

echo '==> Install TunnelBlick VPN client? (Y/n)'
read INSTALL_MACOS_UPDATES
if [ "$INSTALL_MACOS_UPDATES" = 'y' ] || [ "$INSTALL_MACOS_UPDATES" = 'yes' ] || [ "$INSTALL_MACOS_UPDATES" = '' ]; then
    brew cask install tunnelblick
else
    echo '==> Skipping TunnelBlick.'
fi
