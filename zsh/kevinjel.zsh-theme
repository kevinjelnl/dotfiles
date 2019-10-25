# Kevinjel's theme
#
# This a theme for oh-my-zsh. Features a colored prompt with:
# * username@host in workdir [git] $

# git prompt is inspired by:
# https://raw.githubusercontent.com/AmrMKayid/KayidmacOS/master/kayid.zsh-theme

local purple="$FG[099]"
local orange="$FG[202]"
local yellow="$FG[214]"
local cyan="$FG[117]"
local green="%{$fg_bold[green]%}"
local red="%{$fg_bold[red]%}"
local blue="%{$fg_bold[blue]%}"
local magenta="%{$fg_bold[magenta]%}"
local white="%{$fg_bold[white]%}"
local reset="%{$reset_color%}"

if [ "$USER" = "root" ]; then username_color=$red; else username_color=$orange; fi

hostname_color=$yellow

local current_dir_color=$cyan
local username_command="%n"
local hostname_command="%m"
local current_dir="%~"

local username_output="$username_color$username_command$white"
local hostname_output="$hostname_color$hostname_command$white in "
local current_dir_output="$current_dir_color$current_dir$reset"

ZSH_THEME_GIT_PROMPT_PREFIX=""
ZSH_THEME_GIT_PROMPT_SUFFIX=""
ZSH_THEME_GIT_PROMPT_DIRTY=""
ZSH_THEME_GIT_PROMPT_CLEAN="$green"
ZSH_THEME_GIT_PROMPT_UNTRACKED="$blue?"
ZSH_THEME_GIT_PROMPT_MODIFIED="$blue!"
ZSH_THEME_GIT_PROMPT_ADDED="$green+"
ZSH_THEME_GIT_PROMPT_STASHED="$blue$"
ZSH_THEME_GIT_PROMPT_EQUAL_REMOTE="$green✓"
ZSH_THEME_GIT_PROMPT_AHEAD_REMOTE=">"
ZSH_THEME_GIT_PROMPT_BEHIND_REMOTE="<"
ZSH_THEME_GIT_PROMPT_DIVERGED_REMOTE="$red<>"

nl=$'\n%{\r%}';

PROMPT='$username_output@$hostname_output$current_dir_output%1(j. .)'
GIT_PROMPT='$(out=$(git_prompt_info);if [[ -n $out ]]; then printf %s "$white on $purple$out$white [$(git_prompt_status)$(git_remote_status)$white] $reset";fi)'
PROMPT+="$GIT_PROMPT"
PROMPT+='$nl'
PROMPT+='$white$%{$reset_color%} '
