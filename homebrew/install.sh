#!/bin/sh

if test ! $(which brew)
then
  ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

brew bundle --file=$DOTFILES/homebrew/Brewfile --no-lock