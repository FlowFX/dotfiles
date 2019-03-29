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

Install  Oh-My-Zsh

https://github.com/robbyrussell/oh-my-zsh#via-curl

```
$ chsh
/usr/bin/zsh
```

## Install vim-plug
[Install vim-plug](https://github.com/junegunn/vim-plug#neovim). If it's not already installed with the file in `.vim/autoload/`.


## Ruby environment

```
sudo apt install -y libssl-dev libreadline-dev zlib1g-dev
```

rbenv is a submodule of the dotfiles repository. 

```
$ git submodule update --init --recursive 
$ $ ~/.rbenv/bin/rbenv init
```

### Install ruby-build

the ruby-build directory is already ignored in .gitignore.

```
$ mkdir -p "$(rbenv root)"/plugins
$ git clone https://github.com/rbenv/ruby-build.git "$(rbenv root)"/plugins/ruby-build
```




# Resources
- Remapping Caps-Lock: http://www.economyofeffort.com/2014/08/11/beyond-ctrl-remap-make-that-caps-lock-key-useful/
- Vim-plug: https://github.com/junegunn/vim-plug#neovim
