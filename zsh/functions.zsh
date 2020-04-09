# custom functions

# create a new directory and enter it
function md() {
    mkdir -p "$@" && cd "$_";
}

# run the dotbot installer
function dfu_local() {
    cd ~/dotfiles && ./install -q && source ~/.zshrc
}

# PYTHON specific functions
function venv() {
    venvname="${PWD##*/}"
    source ~/.virtualenvs/$venvname/bin/activate
}

function mkvenv() {
    if [ ! $1 ]; then
        pyvers="python3.8"
    else
        pyvers="python$1"
    fi
    venvname="${PWD##*/}"
    $pyvers -m venv ~/.virtualenvs/$venvname && venv
    pip install -r requirements.txt
}
