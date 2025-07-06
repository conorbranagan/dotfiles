# Remove vim swp files
rmswp () {
    rm -f ~/.vim/tmp/*.sw*
    find . -name "*.sw*" -exec rm {} \;
}

# Tar a directory
tgzdir () {
    tar -cvzf `basename $1`.tgz $1
}

# Grep processes.
psgrep() {
    ps aux | grep $* | grep -v grep
}

# Man or help.
moh () {
    cmd=$1
    man $cmd
    if [ $? -ne 0 ]
    then
        $cmd --help
    fi
}

# Delete file contents.
devnull () {
    cat /dev/null > $1
}

# Create an executable file.
exe () {
    touch $1 && chmod a+x $1
}

# Tag the current directory.
tag () {
    ctags -R -o tags .

}

# Print the directory of a Python module.
pymod ()  {
    python -c "import $1,os; print $1.__file__"
}

pyprofile() {
    prof=$1
    shift 1
    python -m cProfile -o $prof $*
    echo "wrote profile to $prof"
}

pystats() {
    python -m pstats $*
}


# Search for a file by name.
name () {
    find . -name $*
}

sumlines () {
    awk '{s+=$1} END {print s}'
}

# Kubectl wrapper function
function k() {
  kubectl "$@"
}

function ccv() {
  local env_vars=(
    "ENABLE_BACKGROUND_TASKS=true"
    "FORCE_AUTO_BACKGROUND_TASKS=true"
  )
  
  local claude_args=()
  
  if [[ "$1" == "-y" ]]; then
    claude_args+=("--dangerously-skip-permissions")
  elif [[ "$1" == "-r" ]]; then
    claude_args+=("--resume")
  elif [[ "$1" == "-ry" ]] || [[ "$1" == "-yr" ]]; then
    claude_args+=("--resume" "--dangerously-skip-permissions")
  fi
  
  env "${env_vars[@]}" claude "${claude_args[@]}"
}
