# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Theme
ZSH_THEME="robbyrussell"

# Plugins
plugins=(
  zsh-autosuggestions
  docker
  kubectl
)

source $ZSH/oh-my-zsh.sh

# General
COMPLETION_WAITING_DOTS="true"
SAVEHIST=99999

# Environment
EDITOR=vim

# Aliases
source $HOME/.aliases
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"
