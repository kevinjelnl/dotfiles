#!/usr/bin/env bash

HISTSIZE=1048576
HISTFILE="$HOME/.bash_history"
SAVEHIST=$HISTSIZE
export HISTCONTROL=ignoreboth:erasedups # remove dupes from history

export EDITOR=vim # use VIM as standar editor

# use ripgrep with FZF and show a preview
export FZF_DEFAULT_OPTS='--height=75% --multi --preview="bat --color=always {}" --preview-window=right:60%:wrap'
export FZF_DEFAULT_COMMAND='rg --files'
export FZF_CTRL_T_COMMAND='$FZF_DEFAULT_COMMAND'
export FZF_CTRL_R_OPTS='--sort --exact'
export LC_ALL=en_US.UTF-8

export BAT_CONFIG_PATH="$HOME/.bat.conf"
export PATH="/usr/local/bin:$PATH"
export GOPATH=$HOME/go
export PATH=$PATH:$(go env GOPATH)/bin
