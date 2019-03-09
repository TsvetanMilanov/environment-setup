# !/bin/bash

set -euo pipefail

function sudo_setup {
    sudo apt update && \
    sudo apt install software-properties-common -y && \
    sudo apt-add-repository ppa:ansible/ansible -y && \
    sudo apt update && \
    sudo apt install software-properties-common ansible build-essential git -y
}

function root_setup {
    apt update && \
    apt install software-properties-common -y && \
    apt-add-repository ppa:ansible/ansible -y && \
    apt update && \
    apt install ansible build-essential git -y
}

(which sudo && sudo_setup) || root_setup

make play-ubuntu-localhost
