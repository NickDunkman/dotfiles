# Allow key repeat in Cursor (instead of showing the accents menu)
defaults delete -g ApplePressAndHoldEnabled                                       
defaults write com.todesktop.230313mzl4w4u92 ApplePressAndHoldEnabled -bool false
#defaults write com.microsoft.VSCode ApplePressAndHoldEnabled -bool false          # For VS Code
#defaults write com.microsoft.VSCodeInsiders ApplePressAndHoldEnabled -bool false  # For VS Code Insider
#defaults write com.visualstudio.code.oss ApplePressAndHoldEnabled -bool false     # For VS Codium
