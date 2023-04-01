#!/usr/bin/env bash

# Setup script for setting up a new macos machine
echo "Starting setup..."

# install xcode CLI
xcode-select --install

# Check for Homebrew to be present, install if it's missing
if test ! $(which brew); then
    echo "Installing homebrew..."
    ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

# Update homebrew recipes
brew update

PACKAGES=(
    adobe-acrobat-reader
    brave-browser
    cask
    gimp
    git
    github
    google-chrome
    google-drive
    iterm2
    keka
    mas
    readline
    rectangle
    snappy
    speedtest-cli
    tcpdump
    terminal-notifier
    tldr
    visual-studio-code
    vlc
)
echo "Installing packages..."
brew install ${PACKAGES[@]}

echo "Macbook setup completed!" | terminal-notifier -sound default