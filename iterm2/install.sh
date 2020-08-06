if ! [ -d /Applications/iTerm.app ]
then
  brew cask install iterm2
fi

# iTerm2 should load from custom preferences in this directory
defaults write com.googlecode.iterm2.plist PrefsCustomFolder -string "$DOTFILES/iterm2"
defaults write com.googlecode.iterm2.plist LoadPrefsFromCustomFolder -bool true