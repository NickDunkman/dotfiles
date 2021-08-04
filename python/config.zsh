# Directory where pyenv is installed
export PYENV_ROOT=$HOME/.pyenv

# Pyenv shims
if command -v pyenv 1>/dev/null 2>&1; then
    eval "$(pyenv init --path)"
fi

export LDFLAGS="-L$(brew --prefix openssl)/lib"
export CFLAGS="-I$(brew --prefix openssl)/include" 