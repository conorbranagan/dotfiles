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
    # FIXME: Check where these came from
    export PATH="/usr/local/opt/coreutils/libexec/gnubin:$PATH"
    export PKG_CONFIG_PATH=/usr/local/opt/openssl/lib/pkgconfig

    # Go env variables
    export GOPATH=/Users/conor.branagan/go
    
    # Do we need this?
    export GOBIN=$GOPATH/bin
fi

# Linux-specific Things
if [[ "$platform" == "Linux" ]]; then

fi

# Go
eval $(gimme 1.23.4) 2> /dev/null

# Rust
. "$HOME/.cargo/env" 

# Ruby
export PATH=$HOME/.rbenv/bin:$PATH
eval "`rbenv init - zsh`"

# Node
[[ -r $NVM_DIR/bash_completion ]] && . $NVM_DIR/bash_completion
