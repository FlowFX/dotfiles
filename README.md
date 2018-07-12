Installation instructions for those configurations that need them.

## Install VIM and Vundle

```bash
git clone git@github.com:FlowFX/dotfiles.git ~/.dotfiles
cd ~/.dotfiles
git submodule update --init --recursive
```

Inside VIM:
```vim
:PluginInstall
```

## iTerm2
To use the configuration file under `.config/iTerms2`, go to Preferences >> General, select `Load preferences from a custom folder` and coose the `.config/iTerms2` directory. Optionally activate `Save changes to folder when iTerm2 quits`. All changes have to propagate via git.
