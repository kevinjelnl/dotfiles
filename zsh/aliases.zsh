# custom aliases

alias diskspace="du -hxs | sort -rn"

dotfileLocation="$HOME/dotfiles"
alias update="sudo apt-get update && sudo apt-get dist-upgrade"
alias cat="batcat"

# choose nvim when available
if type nvim > /dev/null 2>&1; then
  alias vim="nvim"
fi

# use unicode in tmux
alias tmux="tmux -u"
alias tma="tmux attach -t" 
alias tmk="tmux kill-session -t" 

# list all ze things
alias ll="ls -lha"
alias wls="watch ls -lhat"
alias pbcopy='xclip -selection clipboard'

# cd navigation
alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."

# grep colors
alias grep="grep --color=auto"
alias fgrep="fgrep --color=auto"
alias egrep="egrep --color=auto"

# get week number
alias week="date +%V"

# ping standard 5 times
alias ping="ping -c 5"

# protect against overwriting
alias cp="cp -i"
alias mv="mv -i"

alias top="htop" # set top to htop

# when doing local git init then try to commit it, it gives errors
# this fixes that issue
alias gnew="git pull --allow-unrelated-histories origin master"
