#!/bin/bash

set -e

CONFIG_LOCATIONS="$HOME"

for CONFIG_ROOT in $CONFIG_LOCATIONS
do
    mkdir -p $CONFIG_ROOT
    echo "Deploying config files to $CONFIG_ROOT"

    # Ensure we have locations for vim swap and backup.
    mkdir -p $HOME/.vim/backup $HOME/.vim/tmp

    # Deploy each app config file.
    for f in `ls . `
    do
        if [[ $f == "README.md" ]] || [[ $f == "deploy.sh" ]] ; then
            continue
        fi

        if [ -d $f ]; then
            mkdir -p $CONFIG_ROOT/.${f}
            cp -f -r ${f}/* $CONFIG_ROOT/.${f}
        else
            cp -f $f $CONFIG_ROOT/.${f}
        fi
    done
done
