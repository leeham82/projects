#!/usr/bin/env bash

# Brew maintenance
echo “Starting maintenance...”

# Updates the local base of available packages and versions, to be able to know what is updatable
brew update

# Installs new versions of outdated packages
brew upgrade

# Remove stale lock files and outdated downloads for all formulae and casks, and remove old versions of installed formulae.
brew cleanup -s

# Brew diagnostics
brew doctor
brew missing

# App Store app updates via mas
echo “you can hit mas upgrade to upgrade theses apps from the app store:”
mas outdated
echo “install with: mas upgrade”

echo "Macbook maintenance completed!" | terminal-notifier -sound default