Rewrite of my dotfiles based on thoughtbot's dotfile stuff. Old files can be
found in [the legacy branch](https://github.com/FlowFX/dotfiles/tree/legacy).

Current Status: Work In Progress.

# Installation on a new machine

## base requirements

### Ubuntu/Debian

```shell
$ sudo apt install git tmux vim zsh
$ chsh -s $(which zsh)
```

### macOS

First, [Install Homebrew](https://brew.sh/).

```shell
$ brew install git tmux vim zsh
$ chsh -s $(which zsh)
```

Before `chsh` works, you have to edit `/etc/shells` and add the line

```
/usr/local/bin/zsh
```

## dotfiles

```
$ ssh-keygen -o -a 100 -t ed25519 -C "hallo@flowfx.de"
```

Add SSH key to GitHub settings.

Clone and install thoughtbot's dotfiles

```
$ git clone https://github.com/thoughtbot/dotfiles/ ~/dotfiles
$ git clone https://github.com/FlowFX/dotfiles ~/dotfiles-local
```

### rcm
[Install rcm](https://github.com/thoughtbot/rcm#installation)

Ubuntu:
```
$ sudo add-apt-repository ppa:martin-frost/thoughtbot-rcm
$ sudo apt-get update
$ sudo apt-get install rcm
```

macOS:
```
$ brew tap thoughtbot/formulae
$ brew install rcm
```

Symlink fotfiles:
```
$ env RCRC=$HOME/dotfiles/rcrc rcup
```

This provides configs for i3 and nvim.

## i3
```
$ sudo apt install i3
```

## EurKEY
- layout: https://eurkey.steffen.bruentjen.eu/
- Install on macOS: https://github.com/lbschenkel/EurKEY-Mac

On Ubuntu:

```
setxkbmap eu
```

This works with the AltGr key. (Alt is taken by i3)

## Oh-My-Zsh
[Install Oh-My-Zsh](https://ohmyz.sh/)

Let `rcup` overwrite Oh-My-Zsh's `.zshrc`. It is loaded from the
`dotfiles-local/zsh/configs` folder.


## More

For Vim
```
brew install fzf the_silver_searcher
```
