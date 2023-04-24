# show extensions
defaults write NSGlobalDomain "AppleShowAllExtensions" -bool "true"

# show hidden files
defaults write com.apple.Finder AppleShowAllFiles true

# use column view
defaults write com.apple.finder "FXPreferredViewStyle" -string "clmv"

# sort folders to top
defaults write com.apple.finder "_FXSortFoldersFirst" -bool "false"

# don't warn when changing extension
defaults write com.apple.finder "FXEnableExtensionChangeWarning" -bool "false"