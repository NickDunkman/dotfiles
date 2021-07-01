#!/bin/sh

if ! type "brew"; then
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi

brew update
brew bundle --file=$DOTFILES/homebrew/Brewfile --no-lock
brew upgrade