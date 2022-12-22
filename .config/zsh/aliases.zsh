# custom aliases
alias diskspace="du -hxs | sort -rn"
alias update="sudo apt-get update -y && sudo apt-get dist-upgrade -y && sudo apt autoremove -y"
alias docker="sudo docker"
alias venvsible="source $HOME/.virtualenvs/ansible/bin/activate"
alias py='poetry run python'
alias clockfix='sudo ntpdate time.windows.com > /dev/null'

# perhaps test if we are in a WSL session
alias pbcopy='xsel -ib'

# choose nvim when available
if type nvim > /dev/null 2>&1; then
  alias vim="nvim"
  alias vi="nvim"
fi
# use batcat if available
if type batcat > /dev/null 2>&1; then
  alias cat="batcat"
fi

# tmux settings
alias tmux="tmux -u" # use unicode in tmux
alias tma="tmux attach -t"
alias tmk="tmux kill-session -t" 
alias tml="tmux ls" 
alias tmr="tmux rename-session"

# list all ze things
alias ll="ls -lha"
alias wls="watch ls -lhat"

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
alias ping5="ping -c 5"

# protect against overwriting
alias cp="cp -i"
alias mv="mv -i"
alias top="htop" # set top to htop
