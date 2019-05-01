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

# update dotfiles
# function dfu() {
#     (
#         cd ~/.dotfiles && git pull --ff-only && ./install -q
#     )
# }

function dfu_local() {
    cd ~/dotfiles && ./install -q && source ~/.bashrc
}

