# custom functions

# Resolve Pi's Tavily key, then launch directly on this terminal.
unalias pi 2>/dev/null || true
pi() {
    if ! command -v pass-cli >/dev/null 2>&1; then
        command pi --tui-mode fullscreen "$@"
        return
    fi

    local tavily_api_key
    tavily_api_key="$(pass-cli run --no-masking --env-file "$HOME/.config/pi/secrets.env" -- printenv TAVILY_API_KEY)" || return
    [[ -n "$tavily_api_key" ]] || { print -u2 'Proton Pass did not resolve TAVILY_API_KEY.'; return 1; }
    TAVILY_API_KEY="$tavily_api_key" command pi --tui-mode fullscreen "$@"
}

# create a new directory and enter it
function md() {
    mkdir -p "$@" && cd "$_";
}

function rm-dangling-dockerimages() {
    docker rmi $(docker images --filter "dangling=true" -q --no-trunc)
}

function vscode() {
    # found on: https://koenwoortman.com/tmux-sessions-should-be-nested-with-care-unset-tmux-to-force/
    session_name="vscode"
    # 1. First you check if a tmux session exists with a given name.
    tmux has-session -t=$session_name 2> /dev/null
    # 2. Create the session if it doesn't exists.
    if [[ $? -ne 0 ]]; then
      TMUX='' tmux new-session -d -s "$session_name"
    fi
    # 3. Attach if outside of tmux, switch if you're in tmux.
    if [[ -z "$TMUX" ]]; then
      tmux attach -t "$session_name"
    else
      tmux switch-client -t "$session_name"
    fi
}
