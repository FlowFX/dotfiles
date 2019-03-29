Installation instructions for a new machine. Tested on Ubuntu 18.10 on a Lenovo X61, March 2019.

## Install <strike>VIM and Vundle</strike>everything

```
$ sudo apt install git curl zsh neovim tmux tmuxinator neomutt xcape
```

## Checkout dotfiles

Cf. [The best way to store your dotfiles: A bare Git repository](https://www.atlassian.com/git/tutorials/dotfiles).

```shell
$ alias dot='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'
$ git clone --bare git@github.com:FlowFX/dotfiles.git $HOME/.dotfiles

$ alias dot='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'
$ dot checkout

$ dot config --local status.showUntrackedFiles no
```

## Configure Zsh

```
$ chsh
/usr/bin/zsh
```

## Install vim-plug
[Install vim-plug](https://github.com/junegunn/vim-plug#neovim). If it's not already installed with the file in `.vim/autoload/`.



