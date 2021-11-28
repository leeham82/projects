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
    cask
    git
    iterm2
    adobe-acrobat-reader
    visual-studio-code
    google-chrome
    google-drive
    vlc
    keka
    mas
    terminal-notifier
)
echo "Installing packages..."
brew install ${PACKAGES[@]}

echo "Macbook setup completed!" | terminal-notifier -sound default