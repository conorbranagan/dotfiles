# dotfiles

My dotfiles for things.

Right now it supports basic Mac and ArchLinux setup.

- On Arch we use i3 Sway not working with my Nvidia card :(


## Setup

### Mac

1. [Install homebrew](https://brew.sh)

2. [Install Oh-My-ZSH](https://github.com/robbyrussell/oh-my-zsh)

3. [Install iTerm](https://iterm2.com/)

4. Install [Powerline Fonts](https://github.com/powerline/fonts)

5. Install packages

    ```
    brew install rbenv nodenv ack
    ```

6. Install Rust

    ```
    curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
    ```

### Arch


1. Install packages used by dotfiles

    ```
    yay -S rbenv nodenv ack --noconfirm
    ```

2. Install Rust

    ```
    curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
    ```

## Installation

In iTerm:

```
git clone https://github.com/conorbranagan/dotfiles
cd dotfiles
./deploy.sh
cp ./com.googlecode.iterm2.plist ~/Library/Preferences
```

Then restart iTerm
