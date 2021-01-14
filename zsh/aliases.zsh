# custom aliases
alias diskspace="du -hxs | sort -rn"

alias dotfileLocation="$HOME/dotfiles"
alias update="sudo apt-get update -y && sudo apt-get dist-upgrade -y && sudo apt autoremove -y && flatpak update && flatpak remove --unused"
alias cat="batcat"
alias docker="sudo docker"
alias venvsible="source $HOME/.virtualenvs/ansible/bin/activate"

# choose nvim when available
if type nvim > /dev/null 2>&1; then
  alias vim="nvim"
fi

# use unicode in tmux
alias tmux="tmux -u"
alias tma="tmux attach -t" 
alias tmk="tmux kill-session -t" 
alias tml="tmux ls" 

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

# Start Cryptomator from the terminal
alias crp="/usr/bin/nohup ~/Apps/cryptomator.AppImage > /dev/null &"
# Start outlook in chromium kiosk
alias mail="/usr/bin/nohup /snap/bin/chromium --kiosk https://outlook.office.com/mail/inbox > /dev/null &"
# setup workspaces
alias wsinit="/usr/bin/bash ~/dotfiles/scripts/workspace_init.sh"

