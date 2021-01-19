#!/bin/bash

echo "/> Jabba"

curl -sL https://github.com/shyiko/jabba/raw/master/install.sh | bash && . ~/.jabba/jabba.sh

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
[[ -f ${HOME}/.zshrc ]] && echo "source $DIR/.java-source" >> ${HOME}/.zshrc;