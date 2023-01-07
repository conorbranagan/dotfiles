export PATH=$PATH:/usr/local/bin
platform=$(uname)

#
# For work machine
if [ -e /Users/conor.branagan/go ]; then
    VM=/Users/conor.branagan/go/src/github.com/DataDog
    DATADOG_ROOT=$VM

    # newer bash
    export PATH="/usr/local/opt/coreutils/libexec/gnubin:$PATH"
    export PATH="/usr/local/bin:$PATH"

    # go env
    export GOPATH=/Users/conor.branagan/go
    export GOBIN=$GOPATH/bin
    export DDGO=~/dd/dd-go

    # path
    export PATH=$PATH:$VM/dogweb/node_modules/.bin/:$GOROOT/bin:$GOBIN
    if [[ "$platform" == "Darwin" ]]; then
        export PATH="/usr/local/opt/coreutils/libexec/gnubin:$PATH"
    fi

    # node
   [[ -r $NVM_DIR/bash_completion ]] && . $NVM_DIR/bash_completion

    # ruby
    export PATH=$HOME/.rbenv/bin:$PATH
    eval "`rbenv init - zsh`"

    # aws
    export PATH=$HOME/Library/Python/3.6/bin:$PATH
    
    export DATADOG_ROOT="$VM"
    export PATH="$PATH:$DATADOG_ROOT/devtools/bin"
    export PKG_CONFIG_PATH=/usr/local/opt/openssl/lib/pkgconfig

    # nodenv
    eval "$(nodenv init -)"
fi


# Rust
export PATH="$PATH:$HOME/.cargo/bin"
# Set go environment
eval $(gimme 1.19.2) 2> /dev/null
