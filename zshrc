CONFIG_ROOT="$HOME"

# Path to your oh-my-zsh configuration.
export ZSH=$CONFIG_ROOT/.oh-my-zsh

# Set to the name theme to load.
# Look in ~/.oh-my-zsh/themes/
export ZSH_THEME="agnoster"

# Set to this to use case-sensitive completion
# export CASE_SENSITIVE="true"

# Comment this out to disable weekly auto-update checks
export DISABLE_AUTO_UPDATE="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
plugins=(git gitfast redis-cli ruby macos supervisor python gem pip extract rvm wd)

source $ZSH/oh-my-zsh.sh

# custom zsh config
DISABLE_AUTO_TITLE=true
setopt auto_name_dirs
setopt no_prompt_cr
unsetopt correct_all

# powerline font config for linux
if [[ -r /usr/local/lib/python2.7/dist-packages/powerline/bindings/zsh/powerline.zsh ]]; then
    source /usr/local/lib/python2.7/dist-packages/powerline/bindings/zsh/powerline.zsh
fi

# Customize to your needs...
. $CONFIG_ROOT/.aliases.sh
. $CONFIG_ROOT/.functions.sh
. $CONFIG_ROOT/.environments.sh
