#!/bin/sh

rm ~/Library/Application\ Support/Code/User/settings.json 2> /dev/null
ln -s $DOTFILES/vscode/settings.json ~/Library/Application\ Support/Code/User/settings.json 2> /dev/null

# Can generate this list using:
#   code --list-extensions | xargs -L 1 echo code --install-extension

code --install-extension ashpowell.monokai-one-dark-vivid
code --install-extension CoenraadS.bracket-pair-colorizer-2
code --install-extension dbaeumer.vscode-eslint
code --install-extension dotiful.dotfiles-syntax-highlighting
code --install-extension DotJoshJohnson.xml
code --install-extension eamodio.gitlens
code --install-extension eriklynd.json-tools
code --install-extension esbenp.prettier-vscode
code --install-extension mechatroner.rainbow-csv
code --install-extension ms-azuretools.vscode-docker
code --install-extension ms-python.python
code --install-extension oderwat.indent-rainbow
code --install-extension redhat.vscode-yaml
code --install-extension shd101wyy.markdown-preview-enhanced
code --install-extension SonarSource.sonarlint-vscode
code --install-extension streetsidesoftware.code-spell-checker
code --install-extension vscodevim.vim
code --install-extension waderyan.gitblame
code --install-extension yzhang.markdown-all-in-one