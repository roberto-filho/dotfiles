#!/bin/sh
sudo apt-get install -y software-properties-common
sudo apt-add-repository ppa:ansible/ansible -y
sudo apt-get update
sudo apt-get install -y ansible git
cd ~

if [ ! -d "~/workspace/dotfiles" ]; then
    mkdir workspace
    cd workspace
    # clone using https so it does not fail
    git clone https://github.com/roberto-filho/dotfiles.git
fi
