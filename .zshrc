[[ -f "${HOME}/Library/Application Support/codewhisperer/shell/zshrc.pre.zsh" ]] && builtin source "${HOME}/Library/Application Support/codewhisperer/shell/zshrc.pre.zsh"
# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Start in a TMUX shell on startup
if [ -z "$TMUX" ] && [ ${UID} != 0 ]
then
    tmux new-session -A -s main
fi

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to automatically update without prompting.
# DISABLE_UPDATE_PROMPT="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS=true

# Uncomment the following line to disable colors in ls.
DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
#COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
HIST_STAMPS="yyyy-mm-dd"

# Would you like to use another custom folder than $ZSH/custom?
ZSH_CUSTOM=$HOME/.config/zsh

# Which plugins would you like to load?
# Standard plugins can be found in ~/.oh-my-zsh/plugins/*
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
export FZF_BASE=$(which fzf)

plugins=(
    fzf
    supervisor
    ripgrep
    docker
    docker-compose
)

source $ZSH/oh-my-zsh.sh

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
ZSH_THEME="kevinjel"

# User configuration
ZSH_TMUX_AUTOSTART="true"

export EDITOR=vim # use VIM as standar editor
export PATH=$PATH:/usr/local/go/bin # golang
export PATH="$HOME/.local/bin:$PATH" # poetry
eval "$(thefuck --alias)"


# use ripgrep with FZF and show a preview
export FZF_DEFAULT_OPTS="--bind='ctrl-p:toggle-preview' --preview-window 'right:100:wrap:cycle' --height=100 --exact --info='inline' --cycle --reverse --multi"
export FZF_DEFAULT_COMMAND='rg --files'
export FZF_CTRL_T_OPTS="--preview 'bat -n --color=always {}' --bind 'ctrl-/:change-preview-window(down|)'"
export FZF_CTRL_R_OPTS='--sort'
export LC_ALL=en_US.UTF-8

export BAT_CONFIG_PATH="$HOME/.config/bat/.bat.conf"
export PATH="/usr/local/bin:$PATH"

if [[ -f /usr/local/go/bin/go ]] || [[ -f /opt/homebrew/bin/go ]]; then
    export GOPATH=$HOME/go
    export PATH=$PATH:$GOROOT/bin:$GOPATH/bin
    export PATH=$PATH:$(go env GOPATH)/bin
fi

export TERM=tmux-256color
# TLDR colors https://github.com/tldr-pages/tldr-python-client
export TLDR_COLOR_NAME="bold underline"
export TLDR_COLOR_EXAMPLE="yellow bold"
export TLDR_COLOR_COMMAND="red bold"
export TLDR_COLOR_PARAMETER="white bold"

# Load zsh files
for i in $HOME/.config/zsh/*; do
    test -r "$i" && source "$i"
done

# use autojump if installed
if command -v brew &> /dev/null; then
    if brew list --formula | grep -q autojump; then
        [ -f $HOMEBREW_PREFIX/etc/profile.d/autojump.sh ] && . $HOMEBREW_PREFIX/etc/profile.d/autojump.sh
    fi
fi

# CodeWhisperer post block. Keep at the bottom of this file.
[[ -f "${HOME}/Library/Application Support/codewhisperer/shell/zshrc.post.zsh" ]] && builtin source "${HOME}/Library/Application Support/codewhisperer/shell/zshrc.post.zsh"
