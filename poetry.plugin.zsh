zsh-poetry-shell-activate() {
  if [ ! "$(command -v poetry)" ]; then
    echo "Install poetry to use this plugin." > /dev/stderr
    return 1
  fi

  if [ -e "$(pwd)/pyproject.toml" ]; then
    if [ ! "$POETRY_ACTIVE" ]; then
      poetry shell
    fi
  fi  
}

# Add activate to change pwd functions
chpwd_functions+=(zsh-poetry-shell-activate)

