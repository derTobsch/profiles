#!/bin/bash

arg=$1

echo -e "\u001b[32;1mSetting up Dotfiles...\u001b[0m"

if [[ "$arg" == "-i" || "$arg" == "--install" ]]; then

    echo -e "\u001b[37;1m\u001b[4mSelect an option:\u001b[0m"
    echo -e "  \u001b[34;1m 1) for custom zsh \u001b[0m"
    echo -e "  \u001b[34;1m 2) for custom git \u001b[0m"
    echo -e "  \u001b[34;1m 3) for jabba \u001b[0m"
    echo -e "  \u001b[34;1m 4) for docker/kubectl \u001b[0m"
    echo -e "  \u001b[31;1m 0) to Exit \u001b[0m"

    read option

    case $option in

    "1")echo -e "\u001b[7mInstalling custom zsh...\u001b[0m"
        ./zsh/install.sh
        ;;

    "2")echo -e "\u001b[7mInstalling custom git...\u001b[0m"
        ./git/install.sh
        ;;

    "3")echo -e "\u001b[7mInstalling jabba...\u001b[0m"
        ./java/install.sh
        ;;

    "4")echo -e "\u001b[7mInstalling docker/kubectl...\u001b[0m"
        ./docker/install.sh
        ;;

    "0")echo -e "\u001b[4m\u001b[44m Bye \u001b[0m"
        exit 0
        ;;

    *)echo -e "\u001b[31;1m Invalid option entered. \u001b[0m"
        exit 1
        ;;
    esac

    exit 0
fi