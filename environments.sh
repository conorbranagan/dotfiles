export PATH=$PATH:/usr/local/bin
platform=$(uname)

#
# For the host machine
if [ -e ~/dev/datadog/vm ]; then
    VM=~/dev/datadog/vm

    # go env
    export GOPATH=$VM/go
    if [[ "$platform" == "Darwin" ]]; then
        export GOROOT=/usr/local/opt/go/libexec
    else
        export GOROOT=/usr/local/go
    fi
    export GOBIN=$GOROOT/bin
    export DDGO=$GOPATH/src/github.com/DataDog/dd-go

    # path
    export PATH=$PATH:$VM/dogweb/node_modules/.bin/:$GOBIN
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
fi

#
# For the personal-chef vm

if [ -e /home/vagrant/workspace ]
then
    VM=/home/vagrant/workspace

    # go env
    export GOPATH=$VM/go
    export GOROOT=/usr/local/go
    export GOBIN=$GOROOT/bin
    export DDGO=$GOPATH/src/github.com/DataDog/dd-go

    # python
    export DOGWEB_DEFAULT_CONFIG_PATH=$VM/dogweb/development.ini
    source ~/dogweb/python/bin/activate

    # path
    export PATH=$PATH:$VM/dogweb/node_modules/.bin/:$GOBIN

    alias supe='sudo supervisorctl'
fi
