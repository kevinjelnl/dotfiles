#!/usr/bin/env bash

# os conditional aliasses;
if [[ "$(uname)" == "Linux" ]]; then
    # linux
    alias pbcopy='xclip -selection clipboard'
    # test if we are running on WSL
    if [[ "$(uname -r)" =~ Microsoft ]]; then
        # windows linux subsystem
        alias pbcopy='clip.exe'
    fi

    # linux global settings
    alias diskspace='du -h | sort -rn | more'

    # test which package manager is being used
    if [[ ! -z "$(which yum)" ]]; then
        alias update='sudo yum update'
    elif [[ ! -z "$(which apt-get)" ]]; then
        alias update='sudo apt-get update && sudo apt-get upgrade'
    fi

elif [[ "$(uname)" == "Darwin" ]]; then
    # macosx
    alias diskspace='du -hxs | sort -rn'
    alias update='sudo softwareupdate -i -a; brew update; brew upgrade; brew cleanup;'

else
    # ...
    echo 'unknown OS! Running: ' "$(uname -a)"
fi

# use neovim when available
if type nvim > /dev/null 2>&1; then
  alias vim='nvim'
fi

# use unicode in tmux
alias tmux='tmux -u'

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

# get week number
alias week='date +%V'

# ping standard 5 times
alias ping='ping -c 5'

# protect against overwriting
alias cp='cp -i'
alias mv='mv -i'

# an incognito bash without history (; 
alias incognito='bash --init-file <(echo ". ~/.bashrc; unset HISTFILE")'

