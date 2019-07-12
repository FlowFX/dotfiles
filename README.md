Rewrite of my dotfiles based on thoughtbot's dotfile stuff.

Old files can be found in the legacy branch.


## Installing a new Ubuntu machine

### base

```zsh
$ sudo apt update && sudo apt upgrade
$ sudo apt install git tmux zsh
$ chsh -s $(which zsh)
```

### dotfiles

```
$ ssh-keygen -o -a 100 -t ed25519 -C "hallo@flowfx.de"
```

Add SSH key to GitHub settings.

Clone and install thoughtbot's dotfiles

```
$ git clone https://github.com/thoughtbot/dotfiles/ ~/dotfiles
$ git clone https://github.com/FlowFX/dotfiles ~/dotfiles-local
```

[Install rcm](https://github.com/thoughtbot/rcm#installation)

```zsh
$ sudo add-apt-repository ppa:martin-frost/thoughtbot-rcm
$ sudo apt-get update
$ sudo apt-get install rcm

$ env RCRC=$HOME/dotfiles/rcrc rcup
```

This provides configs for i3 and nvim.

### i3
```
$ sudo apt install i3
```

### Neovim
[Install Neovim](https://github.com/neovim/neovim/wiki/Installing-Neovim) from [PPA](https://github.com/neovim/neovim/wiki/Installing-Neovim#ubuntu).
