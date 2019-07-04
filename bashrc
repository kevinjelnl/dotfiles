# load functions
source ~/.shell/functions.sh

# allow local customizations in the ~/.shell_local_before file
if [ -f ~/.shell_local_before ]; then
    source ~/.shell_local_before
fi

# allow local customizations in the ~/.bashrc_local_before file
if [ -f ~/.bashrc_local_before ]; then
    source ~/.bashrc_local_before
fi

# settings
source ~/.bash/settings.bash

# load aliases
source ~/.shell/aliases.sh

# load custom prompt
source ~/.bash/prompt.bash

# FZF settings
[ -f ~/.fzf.bash ] && source ~/.fzf.bash

shopt -s histappend # append to history file
shopt -s nocaseglob; # case-insensitive globbing (used in pathname expansion)
shopt -s cdspell; # autocorrect typos in path names when using `cd`

# allow local customizations in the ~/.shell_local_after file
if [ -f ~/.shell_local_after ]; then
    source ~/.shell_local_after
fi

# allow local customizations in the ~/.bashrc_local_after file
if [ -f ~/.bashrc_local_after ]; then
    source ~/.bashrc_local_after
fi

