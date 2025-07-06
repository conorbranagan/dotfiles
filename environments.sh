export PATH=$PATH:/usr/local/bin
platform=$(uname)

# Environment variables.
export EDITOR=vim
export PATH="/usr/local/bin:$PATH"
export HISTFILE=~/.histfile
export HISTSIZE=1000
export SAVEHIST=1000
export VIRTUAL_ENV_DISABLE_PROMPT=true

# TODO
#[[ -s "$HOME/.tmuxinator/scripts/tmuxinator" ]] && source "$HOME/.tmuxinator/scripts/tmuxinator"

# Mac-specific things
if [[ "$platform" == "Darwin" ]]; then
    # Go env variables
    export GOPATH=$HOME/dev
    export PATH="$HOME/.local/bin:$PATH"
    
    # Do we need this?
    export GOBIN=$GOPATH/bin
fi

# Linux-specific Things
if [[ "$platform" == "Linux" ]]; then

fi

# Rust
. "$HOME/.cargo/env" 

# Ruby
export PATH=$HOME/.rbenv/bin:$PATH
eval "`rbenv init - zsh`"

# Node
[[ -r $NVM_DIR/bash_completion ]] && . $NVM_DIR/bash_completion

# Postgres
export PATH="/opt/homebrew/opt/libpq/bin:$PATH"

# Windsurf
export PATH="$HOME/.codeium/windsurf/bin:$PATH"
export PATH="/opt/homebrew/opt/util-linux/bin:$PATH"