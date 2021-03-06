# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Theme
ZSH_THEME="robbyrussell"

# Plugins
plugins=(
  zsh-autosuggestions
  docker
  kubectl
  asdf
)

source $ZSH/oh-my-zsh.sh

# General
COMPLETION_WAITING_DOTS="true"
SAVEHIST=99999

# Environment
EDITOR=vim

# Aliases
source $HOME/.aliases
