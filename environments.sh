export PATH=$PATH:/usr/local/bin

#
# For on the host machine

if [ -e ~/dev/datadog/vm ]
then
    VM=~/dev/datadog/vm

    # go env
    export GOPATH=$VM/go
    export GOROOT=/usr/local/opt/go/libexec
    export GOBIN=$GOROOT/bin
    export DDGO=$GOPATH/src/github.com/DataDog/dd-go

    # path
    export PATH=$PATH:$VM/dogweb/node_modules/.bin/:$GOBIN

    # node
    export NVM_DIR=~/.nvm
    source `brew --prefix nvm`/nvm.sh
    [[ -r $NVM_DIR/bash_completion ]] && . $NVM_DIR/bash_completion

    # ruby
    eval "`rbenv init - zsh`"
fi

#
# For inside the personal-chef vm

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
