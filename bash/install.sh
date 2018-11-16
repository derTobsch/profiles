#!/bin/bash

echo "/> Bash"

# Get the installation script directory path
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

# Bash
ln -sf ${DIR}/.bash_profile ${HOME}
ln -sf ${DIR}/.bash_aliases ${HOME}
ln -sf ${DIR}/.bash_tweaks ${HOME}

SOURCE_BASH_ALIASES="\nif [ -f ~/.bash_aliases ]; then\n    . ~/.bash_aliases\nfi"
COUNTS_OF_BASH_ALIASES=$(grep -v '^#' ${HOME}/.bashrc | grep -c ".bash_aliases")
if [[ ${COUNTS_OF_BASH_ALIASES} -eq 0 ]]; then
    echo "> Adding 'bash_aliases' source string to ${HOME}/.bashrc"
    printf "$SOURCE_BASH_ALIASES\n" >> "${HOME}/.bashrc"
else
    echo "> Skipped adding 'bash_aliases' to ${HOME}/.bashrc"
fi

SOURCE_BASH_TWEAKS="\nif [ -f ~/.bash_tweaks ]; then\n    . ~/.bash_tweaks\nfi"
if ! grep -qc '~/.bash_tweaks' "${HOME}/.bashrc"; then
    echo "> Adding 'bash_tweaks' source string to ${HOME}/.bashrc"
    printf "$SOURCE_BASH_TWEAKS\n" >> "${HOME}/.bashrc"
else
    echo "> Skipped adding 'bash_tweaks' to ${HOME}/.bashrc"
fi

# Completion
echo "> install bash completion"
sudo apt install bash-completion -y