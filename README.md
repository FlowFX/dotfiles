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

Install base packages.
```shell
$ sudo apt install curl git tmux vim xcape zsh direnv
```

`direnv` is required for my current work project. And it's run on shell startup,
so it's better if it's there already.

Set default shell to `zsh`.

```
$ chsh -s $(which zsh)    # OR for Debian
$ chsh --shell /bin/zsh flowfx
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
$ sudo apt install build-essential libssl-dev libreadline-dev zlib1g-dev
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
sudo apt install fzf silversearcher-ag
```

General
```
brew install tree tig tmuxinator ctags hub markdown pandoc
sudo apt install tree tig tmuxinator exuberant-ctags hub markdown pandoc 

# audo foo
brew install ffmpeg lame flac mplayer
```

PostgreSQL. Follow [this howto](https://itsfoss.com/install-postgresql-ubuntu/ Path to your oh-my-zsh installation), method 2.
```
wget --quiet -O - https://www.postgresql.org/media/keys/ACCC4CF8.asc | sudo apt-key add -
sudo sh -c 'echo "deb http://apt.postgresql.org/pub/repos/apt/ `lsb_release -cs`-pgdg main" >> /etc/apt/sources.list.d/pgdg.list'
sudo apt update
sudo apt install postgresql postgresql-contrib libpq-dev postgis

sudo su postgres
psql
CREATE USER flowfx WITH PASSWORD 'password';
ALTER USER flowfx WITH SUPERUSER;
\q;

sudo systemctl restart postgresql
```
