# history
HISTFILE=$HOME/dbox/devtop/.history
HISTSIZE=4096
SAVEHIST=$HISTSIZE

setopt HIST_IGNORE_ALL_DUPS
setopt extended_history # save timestamp of command and duration
setopt hist_find_no_dups # When searching history don't display results already cycled through twice
setopt append_history # If this is set, zsh sessions will append their history list to the history file, rather than overwrite it
setopt inc_append_history # Add comamnds as they are typed, don't wait until shell exit
setopt share_history # imports new commands and appends typed commands to history
setopt hist_ignore_dups # Do not write events to history that are duplicates of previous events
setopt hist_reduce_blanks # Remove extra blanks from each command line being added to history
setopt hist_verify # don't execute, just expand history
setopt hist_expire_dups_first # when trimming history, lose oldest duplicates first
