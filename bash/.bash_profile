if [[ -f ~/.bashrc ]]; then
   . ~/.bashrc;
fi

[ -s "/home/schneider/.jabba/jabba.sh" ] && source "/home/schneider/.jabba/jabba.sh"


if [ -x "$(command -v kubectl)" ]; then
    source <(kubectl completion bash)
fi
