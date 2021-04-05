# custom functions
# run the dotbot installer
function dfu-local() {
    cd ~/dotfiles && ./install -q && source ~/.zshrc
}


# create a new directory and enter it
function md() {
    mkdir -p "$@" && cd "$_";
}

function rm-dangling-dockerimages(){
    docker rmi $(docker images --filter "dangling=true" -q --no-trunc)
}
function senv() {
    export $(grep -v '^#' .env | xargs -d '\n')
    echo ".env loaded in current shell"
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
