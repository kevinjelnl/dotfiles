#!/usr/bin/env bash

HISTSIZE=1048576
HISTFILE="$HOME/.bash_history"
SAVEHIST=$HISTSIZE
export HISTCONTROL=ignoreboth:erasedups # remove dupes from history

shopt -s histappend # append to history file
shopt -s nocaseglob; # case-insensitive globbing (used in pathname expansion)
shopt -s cdspell; # autocorrect typos in path names when using `cd`

export EDITOR=vim # use VIM as standar editor
