# custom aliases
alias diskspace="du -hxs | sort -rn"
# if operating system is macOS
if [[ "$OSTYPE" == "darwin"* ]]; then
  alias update="brew update && brew upgrade && brew cleanup"
  else
    alias update="sudo apt-get update -y && sudo apt-get dist-upgrade -y && sudo apt autoremove -y"
fi 
alias docker="sudo docker"
alias venvsible="source $HOME/.virtualenvs/ansible/bin/activate"
alias py='poetry run python'
alias clockfix='sudo ntpdate time.windows.com > /dev/null'
alias make_pw='pwgen -y -c -s -1 -n 16 | pbcopy'
alias remoteip='curl http://checkip.amazonaws.com/'
alias shrug="echo '¯\\_(ツ)_/¯' | pbcopy && echo '¯\\_(ツ)_/¯'"


# perhaps test if we are in a WSL session
#alias pbcopy='xsel -ib'

# choose nvim when available
if type nvim > /dev/null 2>&1; then
  alias vim="nvim"
  alias vi="nvim"
fi

# use batcat if available
if type bat > /dev/null 2>&1; then
  alias cat="bat" 
fi

# tmux settings
alias tmux="tmux -u" # use unicode in tmux
alias tm="tmux new-session -A -s main"
alias tma="tmux attach -t"
alias tmk="tmux kill-session -t" 
alias tml="tmux ls" 
alias tmr="tmux rename-session"

# if eza is installed
if type eza > /dev/null 2>&1; then
  alias ls="eza --all"
  alias ll="eza --long --all --sort=size"
  alias tree="eza --long --tree"
  else
    alias ll="ls -lha"
fi

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
alias top="btop" # set top to htop
