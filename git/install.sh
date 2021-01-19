#!/bin/bash

echo "/> Git"

sudo apt-get update
sudo apt-get install curl

# Get the installation script directory path
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

# Git
[[ -f ${HOME}/.gitconfig ]] && cp ${HOME}/.gitconfig ${HOME}/.gitconfig.bak
ln -sf ${DIR}/.gitconfig ${HOME}

# Bash with Git
curl -s https://raw.githubusercontent.com/git/git/master/contrib/completion/git-prompt.sh \
  -o ${HOME}/.git-prompt.sh

## GitIgnore
curl -s https://www.gitignore.io/api/java,intellij,gradle,kotlin \
  -o ${HOME}/.gitignore
