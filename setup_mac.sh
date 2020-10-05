#!/usr/bin/env bash
# File: setup_mac.sh
# Author: Liam Williamson
# Creation date: 28th June 2019
# Description: Used to install and configure Engineering MacBooks
# Usage: ./setup_mac.sh 2>&1 | tee setup_mac.log
. std_lib.sh

log "Running setup_mac on $HOSTNAME"

# Install Xcode
log "Installing xcode-stuff"
xcode-select --install

# Install JumpCloud agent
log "Installing JumpCloud agent..."
. install_jumpcloud_agent_and_serviceaccount.sh

# Check for Homebrew. Install if we don't have it
if test ! $(which brew); then
  log "Installing homebrew..."
  ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

# Update homebrew recipes
log "Updating homebrew..."
brew update

# Upgrade any already-installed formulae
log "Upgrading homebrew formlulae"
brew upgrade

# Install slackcat and create config file
log "Installing Slackcat"
brew install slackcat
log "creating slackcat config file..."
echo 'default_team = "servicedesk"
default_channel = ""

[teams]
  servicedesk = "xoxp-6124994742-653677661335-673797408371-dd3ac19b740809c7a671450f184e4f77"' >> ~/.slackcat

# Install dev tools
log "Installing Git..."
brew install git

log "Installing brew git utilities..."
brew install git-extras legit git-flow

log "Installing Redis..."
brew install redis

log "Installing MySQL 5.7 Client..."
brew install mysql-client
brew link mysql-client --force

log "Installing OpenSSL..."
brew install openssl

log "Installing homebrew cask"
brew install cask

# List of GUI apps to install via brew cask
apps=(
  authy
  iterm2
  postman
  sequel-pro
  slack
  sublime-text
)

# Install apps to /Applications
# Default is: /Users/$user/Applications
log "installing apps with Cask..."
brew cask install --appdir="/Applications" ${apps[@]}

# Remove outdated versions from the cellar
log "Cleaning up brew"
brew cleanup

# Restart Finder
killall Finder

log "Done!"

# Post logfile to #servicedesk Slack channel
slackcat --channel servicedesk --filetype shell --comment "setup_mac script completed on $HOSTNAME" setup_mac.log
