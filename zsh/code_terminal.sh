#!/bin/sh
SESSION=vscode`pwd | md5sum | cut -f 1 -d “ “`
tmux attach-session -d -t $SESSION || tmux new-session -s $SESSION
