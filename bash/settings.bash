#!/usr/bin/env bash

HISTSIZE=1048576
HISTFILE="$HOME/.bash_history"
SAVEHIST=$HISTSIZE
export HISTCONTROL=ignoreboth:erasedups # remove dupes from history

export EDITOR=vim # use VIM as standar editor
export BAT_CONFIG_PATH="~/.bat.conf"

# use ripgrep with FZF and show a preview
export FZF_DEFAULT_OPTS='--height=70% --preview="cat {}" --preview-window=right:60%:wrap'
export FZF_DEFAULT_COMMAND='rg --files'
export FZF_CTRL_T_COMMAND='$FZF_DEFAULT_COMMAND'
