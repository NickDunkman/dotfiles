GLOBAL_PYTHON_VERSION=3.13

pyenv install $GLOBAL_PYTHON_VERSION --skip-existing

# This updates ~/.pyenv/version to point at the specified version. This means
# pyenv will use this version everywhere unless in a subdirectory which overrides
# to a different version.
pyenv global $GLOBAL_PYTHON_VERSION

if ! type "poetry" > /dev/null; then
  pipx install poetry
else
  pipx upgrade poetry
fi

pyenv rehash