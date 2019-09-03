My dotfiles, based on [thoughtbot's
dotfiles](https://github.com/thoughtbot/dotfiles/) and
[rcm](https://github.com/thoughtbot/rcm). My old files
are archived in [the legacy
branch](https://github.com/FlowFX/dotfiles/tree/legacy).

Current Status: all of my machines, running macOS and Ubuntu, are using these
configurations.

# Installation on a new machine

## base requirements

### Ubuntu/Debian

```shell
$ sudo apt install curl git tmux vim xcape zsh
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
$ git clone git@github.com:FlowFX/dotfiles.git ~/dotfiles-local
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

Symlink dotfiles:
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
The thoughtbot configs don't play well with Oh-My-Zsh. Themes don't work anymore. But I want the `z` plugin.

[Install Oh-My-Zsh](https://ohmyz.sh/)

Let `rcup` overwrite Oh-My-Zsh's `.zshrc`. It is loaded from the
`dotfiles-local/zsh/configs` folder.


## asdf-vm

```
$ git clone https://github.com/asdf-vm/asdf.git ~/.asdf --branch v0.7.3
```

Everything's already loaded by the existing dotfiles.

```
$ asdf update
$ asdf plugin-add ruby
$ asdf plugin-add python
$ asdf install ruby 2.6.2
$ asdf install ruby 2.6.3
$ asdf global ruby 2.6.3
```

## More

For Vim
```
brew install fzf the_silver_searcher
```

General
```
brew install tree tig tmuxinator ctags hub markdown pandoc

# audo foo
brew install ffmpeg lame flac mplayer
```
