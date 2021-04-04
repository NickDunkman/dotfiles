# Highest precedence first
paths=(
  $DOTFILES/bin
  $HOME/.pyenv/bin
  $HOME/.poetry/bin
  $HOME/.cargo/bin
  /usr/local/bin
  /usr/bin
  /bin
  /usr/sbin
  /sbin
)

export PATH=${(j[:])paths}
