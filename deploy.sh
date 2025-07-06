#!/bin/bash

set -e

CONFIG_LOCATIONS="$HOME"
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
ENV_FILE="$SCRIPT_DIR/.env.local"

# Load environment variables if the file exists
if [ -f "$ENV_FILE" ]; then
    echo "Loading configuration from .env.local"
    source "$ENV_FILE"
else
    echo "No .env.local file found. You'll be prompted for values."
fi

# Function to prompt for a value if not set
prompt_if_empty() {
    local var_name=$1
    local prompt_text=$2
    local current_value=${!var_name}
    
    if [ -z "$current_value" ]; then
        read -p "$prompt_text: " value
        eval "$var_name='$value'"
    fi
}

# Prompt for git configuration if not in env file
prompt_if_empty "GIT_USER_NAME" "Enter your Git user name"
prompt_if_empty "GIT_USER_EMAIL" "Enter your Git email"

for CONFIG_ROOT in $CONFIG_LOCATIONS
do
    mkdir -p $CONFIG_ROOT
    echo "Deploying config files to $CONFIG_ROOT"

    # Ensure we have locations for vim swap and backup.
    mkdir -p $HOME/.vim/backup $HOME/.vim/tmp
    
    # Ensure Claude directory exists
    mkdir -p $HOME/.claude

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
    
    # Process gitconfig template
    if [ -f "$CONFIG_ROOT/.gitconfig" ]; then
        echo "Processing gitconfig template..."
        sed -i.bak "s/__GIT_USER_NAME__/$GIT_USER_NAME/g" "$CONFIG_ROOT/.gitconfig"
        sed -i.bak "s/__GIT_USER_EMAIL__/$GIT_USER_EMAIL/g" "$CONFIG_ROOT/.gitconfig"
        rm -f "$CONFIG_ROOT/.gitconfig.bak"
    fi
done

# Setup SSH allowed_signers for git commit signing
setup_git_signing() {
    local ssh_key_path="$HOME/.ssh/id_ed25519.pub"
    local allowed_signers="$HOME/.ssh/allowed_signers"
    
    if [ -f "$ssh_key_path" ]; then
        echo "Setting up Git commit signing..."
        if [ -n "$GIT_USER_EMAIL" ] && [ -f "$ssh_key_path" ]; then
            # Create allowed_signers with the user's public key
            echo "$GIT_USER_EMAIL $(cat $ssh_key_path)" > "$allowed_signers"
            echo "Git commit signing configured with SSH key"
        else
            echo "Warning: Could not configure Git signing - missing email or SSH key"
        fi
    else
        echo "Warning: SSH key not found at $ssh_key_path - Git signing will not work"
    fi
}

# Run the setup function after deploying configs
setup_git_signing
