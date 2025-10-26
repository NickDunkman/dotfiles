# Allow key repeat in VSCode (instead of showing the accents menu)
defaults delete -g ApplePressAndHoldEnabled                                       
defaults write com.microsoft.VSCode ApplePressAndHoldEnabled -bool false          # For VS Code
defaults write com.microsoft.VSCodeInsiders ApplePressAndHoldEnabled -bool false  # For VS Code Insider
defaults write com.visualstudio.code.oss ApplePressAndHoldEnabled -bool false     # For VS Codium
