#!/bin/bash

sudo apt update
sudo apt upgrade -y

function install
{
    which $1 &> /dev/null

    if [ $? -ne 0 ]; then
        echo "Installing: ${1}..."
        sudo apt install -y $1
    else
        echo "Already installed: ${1}"
    fi
}

# system
install gnome-tweaks
install gnome-shell-extensions
install timeshift

# development
install git
install vim
install codium

# applications
install thunderbird
install firefox