# Install FTS Packages

echo '==> Install TunnelBlick VPN client? (Y/n)'
read INSTALL_MACOS_UPDATES
if [ "$INSTALL_MACOS_UPDATES" = 'y' ] || [ "$INSTALL_MACOS_UPDATES" = 'yes' ] || [ "$INSTALL_MACOS_UPDATES" = '' ]; then
    brew cask install tunnelblick
else
    echo '==> Skipping TunnelBlick.'
fi

echo '==> Did you set up your SSH key yet? (Y/n)'
read SSH_KEY
if [ "$SSH_KEY" = 'y' ] || [ "$SSH_KEY" = 'yes' ] || [ "$SSH_KEY" = '' ]; then
    echo '==> Clone FTS source code? (Y/n)'
    read FTS_SOURCE
    if [ "$FTS_SOURCE" = 'y' ] || [ "$FTS_SOURCE" = 'yes' ] || [ "$FTS_SOURCE" = '' ]; then
        mkdir -p ~/code/fts
        cd ~/code/fts
        git clone git@github.com:sporting-innovations/fan360Core.git
        git clone git@github.com:sporting-innovations/global-ref-data.git
        git clone git@github.com:sporting-innovations/fan360-dimension.git
        git clone git@github.com:sporting-innovations/si-dimension.git
        git clone git@github.com:sporting-innovations/fan-classification.git
        git clone git@github.com:sporting-innovations/fan360-communications.git
        git clone git@github.com:sporting-innovations/fan360-triggers.git
   else
        echo '==> Skipping FTS source code.'
    fi

fi
