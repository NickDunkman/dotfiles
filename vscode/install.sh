rm ~/Library/Application\ Support/Code/User/settings.json 2> /dev/null
ln -s $DOTFILES/vscode/settings.json ~/Library/Application\ Support/Code/User/settings.json 2> /dev/null

# Can generate this list using:
#   code --list-extensions | xargs -L 1 echo code --install-extension

code --install-extension ashpowell.monokai-one-dark-vivid --force
code --install-extension dbaeumer.vscode-eslint --force
code --install-extension dotiful.dotfiles-syntax-highlighting --force
code --install-extension DotJoshJohnson.xml --force
code --install-extension eamodio.gitlens --force
code --install-extension eriklynd.json-tools --force
code --install-extension esbenp.prettier-vscode --force
code --install-extension mechatroner.rainbow-csv --force
code --install-extension ms-azuretools.vscode-docker --force
code --install-extension ms-python.python --force
code --install-extension ms-python.vscode-pylance --force
code --install-extension oderwat.indent-rainbow --force
code --install-extension redhat.vscode-yaml --force
code --install-extension shd101wyy.markdown-preview-enhanced --force
code --install-extension silvenon.mdx --force
code --install-extension stylelint.vscode-stylelint --force
code --install-extension vscodevim.vim --force
code --install-extension waderyan.gitblame --force
code --install-extension yzhang.markdown-all-in-one --force