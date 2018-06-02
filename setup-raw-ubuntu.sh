# !/bin/bash

function sudo_setup {
    sudo apt-get update && \
    sudo apt-get install software-properties-common -y && \
    sudo apt-add-repository ppa:ansible/ansible -y && \
    sudo apt-get update && \
    sudo apt-get install software-properties-common ansible build-essential git -y
}

function root_setup {
    apt-get update && \
    apt-get install software-properties-common -y && \
    apt-add-repository ppa:ansible/ansible -y && \
    apt-get update && \
    apt-get install ansible build-essential git -y
}

(which sudo && sudo_setup) || root_setup

make play-ubuntu-localhost
