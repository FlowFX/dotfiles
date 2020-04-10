My dotfiles, based on [thoughtbot's dotfiles](https://github.com/thoughtbot/dotfiles/) and
[rcm](https://github.com/thoughtbot/rcm).

Current Status: all of my machines, running Arch Linux, Debian, and macOS, are using these
configurations. Everything's managed by an [Ansible playbook](https://github.com/flowfx/ansible-localhost).


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
