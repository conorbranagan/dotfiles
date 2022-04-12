export PATH=$PATH:/usr/local/bin
platform=$(uname)

#
# For the host machine
if [ -e /Users/conor.branagan/go ]; then
    VM=/Users/conor.branagan/go/src/github.com/DataDog
    DATADOG_ROOT=$VM

    # newer bash
    export PATH="/usr/local/opt/coreutils/libexec/gnubin:$PATH"
    export PATH="/usr/local/bin:$PATH"

    # go env
    export GOPATH=/Users/conor.branagan/go
    #if [[ "$platform" == "Darwin" ]]; then
    #    export GOROOT=/usr/local/opt/go/libexec
    #else
    #    export GOROOT=/usr/local/go
    #fi
    export GOBIN=$GOPATH/bin
    export DDGO=~/dd/dd-go

    # path
    export PATH=$PATH:$VM/dogweb/node_modules/.bin/:$GOROOT/bin:$GOBIN
    if [[ "$platform" == "Darwin" ]]; then
        export PATH="/usr/local/opt/coreutils/libexec/gnubin:$PATH"
    fi

    # node
    export NVM_DIR=~/.nvm
    if [[ "$platform" == "Darwin" ]]; then
        source `brew --prefix nvm`/nvm.sh
    else
        source $NVM_DIR/nvm.sh
    fi
    [[ -r $NVM_DIR/bash_completion ]] && . $NVM_DIR/bash_completion

    # ruby
    export PATH=$HOME/.rbenv/bin:$PATH
    eval "`rbenv init - zsh`"

    # aws
    export PATH=$HOME/Library/Python/3.6/bin:$PATH
fi

#
# For the personal-chef vm

if [ -e ~/dogweb ]
then
    VM=~
    DATADOG_ROOT=$VM

    # go env
    export GOPATH=~/go
    export GOROOT=/usr/local/go
    export GOBIN=$GOPATH/bin
    export DDGO=$GOPATH/src/github.com/DataDog/dd-go

    # python
    export DOGWEB_DEFAULT_CONFIG_PATH=$VM/dogweb/development.ini
    source ~/python/bin/activate

    # path
    export PATH=$PATH:$VM/dogweb/node_modules/.bin/:$GOROOT/bin:$GOBIN
    alias supe='sudo supervisorctl'
fi

export DATADOG_ROOT="$VM"
export PATH="$PATH:$DATADOG_ROOT/devtools/bin"
export PKG_CONFIG_PATH=/usr/local/opt/openssl/lib/pkgconfig


# Set go environment
eval $(gimme 1.17.7) 2> /dev/null
