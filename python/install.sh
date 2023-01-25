if ! type "poetry" > /dev/null; then
  curl -sSL https://install.python-poetry.org | python -
fi

pyenv rehash