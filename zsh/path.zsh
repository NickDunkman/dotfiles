# Highest precedence first
paths=(
  $DOTFILES/bin
  $HOME/.pyenv/shims
  $HOME/.pyenv/bin
  $HOME/.poetry/bin
  $HOME/.cargo/bin
  /opt/homebrew/bin
  /opt/homebrew/sbin
  /usr/local/bin
  /usr/bin
  /bin
  /usr/sbin
  /sbin
)

export PATH=${(j[:])paths}
