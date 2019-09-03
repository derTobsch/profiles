#!/bin/bash

echo "/> Installing zsh"
sudo apt update && sudo apt install zsh -y

echo "/> Installing oh-my-zsh"
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

echo "/> Installing zsh plugins"
git clone https://github.com/zsh-users/zsh-autosuggestions ~/.oh-my-zsh/custom/plugins/zsh-autosuggestions

echo "/> Configure zsh configurations"
# Get the installation script directory path
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

ln -sf ${DIR}/.zshrc ${HOME}
ln -sf ${DIR}/.aliases ${HOME}
