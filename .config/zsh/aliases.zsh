# custom aliases
alias diskspace="du -hxs | sort -rn"
alias update="sudo apt-get update -y && sudo apt-get dist-upgrade -y && sudo apt autoremove -y"
alias venvsible="source $HOME/.virtualenvs/ansible/bin/activate"
alias py='poetry run python'
alias mdview='glow -p'
alias fk='fuck'
alias clockfix='sudo ntpdate time.windows.com > /dev/null'
alias SHELL=/usr/bin/zsh

# perhaps test if we are in linux session
alias pbcopy='xsel -ib'

# Prefer a native `code` command, including the Windows VS Code CLI exposed by
# WSL. Use the Flatpak build only when no native command is available.
if command -v code >/dev/null 2>&1; then
  unalias code 2>/dev/null
elif command -v flatpak >/dev/null 2>&1; then
  alias code='flatpak run com.visualstudio.code'
else
  unalias code 2>/dev/null
fi

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
tmux() {
  if (( $# == 0 )); then
    command tmux -u new-session -A -s main
  else
    command tmux -u "$@"
  fi
}
alias tm="tmux" # start or attach to the main session
alias tma="tmux attach -t"
alias tmk="tmux kill-session -t" 
alias tml="tmux ls" 
alias tmr="tmux rename-session"

# list all ze things
if command -v lsd >/dev/null 2>&1; then
  alias ls="lsd"
else
  alias ls="ls --color=auto"
fi
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
alias top="btop" # set top to htop

