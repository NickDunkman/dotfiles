if ! type "poetry" > /dev/null; then
  curl -sSL https://raw.githubusercontent.com/python-poetry/poetry/master/get-poetry.py | python
fi

pyenv rehash