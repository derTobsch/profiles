#!/bin/bash

echo "/> Git"

# Get the installation script directory path
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

# Git
ln -sf ${DIR}/.gitconfig ${HOME}

# Bash with Git
curl -s https://raw.githubusercontent.com/git/git/master/contrib/completion/git-prompt.sh \
  -o ${HOME}/.git-prompt.sh

## GitIgnore
curl -s https://www.gitignore.io/api/java,intellij,gradle,kotlin \
  -o ${HOME}/.gitignore