# Install NVM first, to manage one or more installations of node/npm/etc
if [ ! -d ~/.nvm ]; then
  curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.40.2/install.sh | bash
fi

# Activate NVM
. ~/.nvm/nvm.sh

# Install/update Node & NPM
nvm install --lts

# Install yarn
if ! type "yarn" > /dev/null; then
  npm install --global corepack
else
  npm upgrade --global corepack
fi