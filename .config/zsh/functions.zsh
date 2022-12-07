# custom functions

# create a new directory and enter it
function md() {
    mkdir -p "$@" && cd "$_";
}

function rm-dangling-dockerimages(){
    docker rmi $(docker images --filter "dangling=true" -q --no-trunc)
}
