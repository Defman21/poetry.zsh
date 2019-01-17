zsh-poetry-shell-activate() {
  if [ ! "$(command -v poetry)" ]; then
    echo "Install poetry to use this plugin." > /dev/stderr
    return 1
  fi

  local pyproject=$(pwd)/pyproject.toml

  if [ -e $pyproject ]; then
    if [ ! "$POETRY_ACTIVE" ]; then
      if grep -Fxq "[tool.poetry]" $pyproject; then
        poetry shell
      fi
    fi
  fi  
}

# Add activate to change pwd functions
chpwd_functions+=(zsh-poetry-shell-activate)

