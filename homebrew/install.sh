#!/bin/sh
#
# Homebrew
#
# This installs some of the common dependencies needed (or at least desired)
# using Homebrew.

# Check for Homebrew
if test ! $(which brew)
then
  ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

brew install git autojump grc coreutils

# install nerd fonts (for powerlevel10k prompt)
brew tap homebrew/cask-fonts
brew cask install font-meslo-for-powerline

exit 0