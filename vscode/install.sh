rm ~/Library/Application\ Support/Code/User/settings.json 2> /dev/null
ln -s $DOTFILES/vscode/settings.json ~/Library/Application\ Support/Code/User/settings.json 2> /dev/null

# Can generate this list using:
#   code --list-extensions | xargs -L 1 echo code --install-extension

code \
    --install-extension ashpowell.monokai-one-dark-vivid --force \
    --install-extension dbaeumer.vscode-eslint --force \
    --install-extension dotiful.dotfiles-syntax-highlighting --force \
    --install-extension DotJoshJohnson.xml --force \
    --install-extension eamodio.gitlens --force \
    --install-extension eriklynd.json-tools --force \
    --install-extension esbenp.prettier-vscode --force \
    --install-extension GitHub.copilot --force \
    --install-extension johnpapa.vscode-peacock --force \
    --install-extension mechatroner.rainbow-csv --force \
    --install-extension ms-azuretools.vscode-docker --force \
    --install-extension oderwat.indent-rainbow --force \
    --install-extension redhat.vscode-yaml --force \
    --install-extension shd101wyy.markdown-preview-enhanced --force \
    --install-extension unifiedjs.vscode-mdx --force \
    --install-extension stylelint.vscode-stylelint --force \
    --install-extension vscodevim.vim --force \
    --install-extension waderyan.gitblame --force \
    --install-extension yzhang.markdown-all-in-one --force