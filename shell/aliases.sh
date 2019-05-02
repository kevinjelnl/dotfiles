#!/usr/bin/env bash

# os conditional aliasses;
if [[ "$(uname)" == "Linux" ]]; then
    alias pbcopy='xclip -selection clipboard'
    alias pbpaste='xclip -selection clipboard -o'
    alias diskspace='du -h | sort -rn | more'
    alias update='sudo apt-get update && sudo apt-get upgrade'
elif [[ "$(uname)" == "Darwin" ]]; then
    alias diskspace='du -hxs | sort -rn'
    alias update='sudo softwareupdate -i -a; brew update; brew upgrade; brew cleanup;'
fi

# use neovim when available
if type nvim > /dev/null 2>&1; then
  alias vim='nvim'
fi

# list all ze things
alias ll="ls -lha"

# cd navigation
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'

# grep colors
alias grep="grep --color=auto"
alias fgrep="fgrep --color=auto"
alias egrep="egrep --color=auto"

# Get week number
alias week='date +%V'

# ping standard 5 times
alias ping='ping -c 5'

# Aliases to protect against overwriting
alias cp='cp -i'
alias mv='mv -i'
