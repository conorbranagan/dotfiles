if [ -e ~/dev/datadog/vm ]
then
    VM=~/dev/datadog/vm

    # go env
    export GOPATH=$VM/go
    export GOROOT=/usr/local/opt/go
    export GOBIN=$GOROOT/bin
    export DDGO=$GOPATH/src/github.com/DataDog/dd-go

    # path
    export PATH=$PATH:$VM/dogweb/node_modules/.bin/:$GOBIN
fi

if [ -e /home/vagrant/workspace ]
then
    VM=/home/vagrant/workspace

    # go env
    export GOPATH=$VM/go
    export GOROOT=/usr/local/opt/go
    export GOBIN=$GOROOT/bin
    export DDGO=$GOPATH/src/github.com/DataDog/dd-go

    # python
    export DOGWEB_DEFAULT_CONFIG_PATH=$VM/dogweb/development.ini
    source ~/dogweb/python/bin/activate

    # path
    export PATH=$PATH:$VM/dogweb/node_modules/.bin/:$GOBIN
fi
