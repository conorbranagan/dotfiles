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

# Custom prompt configuration
# Override the agnoster prompt with custom PS1
prompt_custom_ps1() {
  # Get current directory name
  local dir_name="%F{cyan}$(basename "$PWD")%f"
  
  # Get git branch info
  local git_info=""
  if git rev-parse --git-dir > /dev/null 2>&1; then
    local branch=$(git symbolic-ref --short HEAD 2>/dev/null || git describe --tags --exact-match 2>/dev/null || git rev-parse --short HEAD 2>/dev/null)
    local git_status=""
    
    # Check for uncommitted changes
    if [[ -n $(git status --porcelain 2>/dev/null) ]]; then
      git_status=" %F{red}[+]%f"
    fi
    
    git_info=" %F{242}on%f %F{135}%f %F{242}${branch}%f${git_status}"
  fi
  
  # Get Python virtual env info
  local venv_info=""
  if [[ -n "$VIRTUAL_ENV" ]]; then
    local venv_name=$(basename "$VIRTUAL_ENV")
    venv_info=" %F{242}via%f %F{227}%f %F{227}v$(python --version 2>&1 | awk '{print $2}')%f %F{242}via%f %F{75}❄%f  %F{242}${venv_name} (${venv_name})%f"
  fi
  
  # Build the prompt - first line
  echo -n "${dir_name}${git_info}${venv_info}"
}

# Custom right prompt for time
prompt_custom_rps1() {
  echo -n "%F{242}at %D{%H:%M:%S}%f"
}

# Override the theme completely
prompt_off() {
  unset_prompt_functions
}

# Function to unset agnoster prompt functions
unset_prompt_functions() {
  # Remove agnoster functions from precmd
  precmd_functions=(${precmd_functions:#build_prompt})
  precmd_functions=(${precmd_functions:#prompt_agnoster_precmd})
}

# Set up the custom prompt
setopt PROMPT_SUBST
PROMPT='$(prompt_custom_ps1)
%F{135}✦%f %F{242}at %D{%H:%M:%S}%f %F{white}→%f '
RPROMPT=''

# Ensure agnoster doesn't override our prompt
prompt_off
