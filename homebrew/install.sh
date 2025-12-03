if ! type "brew" > /dev/null; then
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi

brew update
brew bundle --file=$DOTFILES/homebrew/Brewfile
brew upgrade

outdated_apps=$(mas outdated)
if [ -n "$outdated_apps" ]; then
  echo "there are app store apps to upgrade! requires password ..."
  mas upgrade
fi
