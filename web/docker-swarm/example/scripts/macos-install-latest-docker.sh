#!/usr/bin/env bash

# Check if brew cask extension is installed
if ! brew info cask &>/dev/null; then
  echo "Pleas Install Brew Cask Extension! (Homebrew Extension)"
  exit 1
fi

# Install docker
brew cask install docker
brew cask install docker-compose
brew cask install docker-machine
