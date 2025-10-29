# Install FNM (Fast Node Manager) to manage one or more installations of node/npm/etc
if [ ! -d /opt/homebrew/opt/fnm/bin ]; then
  curl -fsSL https://fnm.vercel.app/install | bash
fi

# Install/update Node & NPM
fnm install --lts

# corepack includes yarn!
# to add more global installs, just tack onto the following line
npm install --global corepack
npm update --global
