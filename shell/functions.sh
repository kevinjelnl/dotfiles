#!/usr/bin/env bash

# sudo last command or just sudo
function s() {
    if [[ $# == 0 ]]; then
        sudo $(history -p '!!')
    else
        sudo "$@"
    fi
}

# create a new directory and enter it
function md() {
    mkdir -p "$@" && cd "$_";
}

# run the dotbot installer
function dfu_local() {
    cd ~/dotfiles && ./install -q && source ~/.bashrc
}

