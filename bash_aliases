# vim: syn=sh

if [ -e ~/dd ]; then
    # Host machine
    CONFIG_ROOT="$HOME"
else
    # DD devenv
    CONFIG_ROOT="$HOME/.user-config"
fi

# Setup ZSH
#if [[ $(sudo dpkg -l | grep -c zsh) -eq 0 ]]; then
#  sudo apt-get install -y -q zsh > /dev/null 2>&1
#fi

# First install oh-my-zsh
#if [ ! -f $CONFIG_ROOT/.oh-my-zsh/oh-my-zsh.sh ]; then
#    echo "Cloning oh-myzsh"
#    git clone https://github.com/robbyrussell/oh-my-zsh.git $CONFIG_ROOT/.oh-my-zsh
#    #ln -s $CONFIG_ROOT/.oh-my-zsh/ $CONFIG_ROOT/oh-my-zsh-config/themes
#fi

. $CONFIG_ROOT/.exports.sh
. $CONFIG_ROOT/.aliases.sh
. $CONFIG_ROOT/.functions.sh
. $CONFIG_ROOT/.environments.sh


# Setup vim.
mkdir -p ~/.vim/backup ~/.vim/tmp
if [ ! -d ~/.vim/bundle/vundle ]; then
    echo "Cloning vundle"
    git clone https://github.com/gmarik/vundle.git ~/.vim/bundle/vundle
    vim +BundleInstall +qall
fi

# Set up git.
git config --global core.excludesfile ~/.gitignore
if [[ -n $1  &&  -n $2 ]] ; then
    git config --global user.name "$1"
    git config --global user.email "$2"
fi
