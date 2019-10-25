# custom functions

# create a new directory and enter it
function md() {
    mkdir -p "$@" && cd "$_";
}

# run the dotbot installer
function dfu_local() {
    cd ~/dotfiles && ./install -q && source ~/.zshrc
}
