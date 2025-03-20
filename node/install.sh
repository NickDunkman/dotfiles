# Install NVM first, to manage one or more installations of node/npm/etc
if [ ! -d ~/.nvm ]; then
  curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.40.2/install.sh | bash
fi

# Activate NVM
. ~/.nvm/nvm.sh

# Install/update Node & NPM
nvm install --lts

# corepack includes yarn!
# to add more global installs, just tack onto the following line
npm install --global corepack
npm update --global