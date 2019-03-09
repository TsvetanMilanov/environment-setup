# !/bin/bash

set -euo pipefail

function sudo_setup {
    sudo apt update && \
    sudo apt install software-properties-common -y && \
    sudo apt-add-repository ppa:ansible/ansible -y && \
    sudo add-apt-repository universe -y && \
    sudo apt update && \
    sudo apt install software-properties-common sshpass ansible build-essential git -y
}

function root_setup {
    apt update && \
    apt install software-properties-common -y && \
    apt-add-repository ppa:ansible/ansible -y && \
    sudo add-apt-repository universe -y && \
    apt update && \
    apt install sshpass ansible build-essential git -y
}

if `which sudo &> /dev/null`; then
    sudo_setup
else
    root_setup
fi

make play-ubuntu-localhost
