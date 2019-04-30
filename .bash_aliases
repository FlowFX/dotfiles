# Store dotfiles in a bare repository
# https://developer.atlassian.com/blog/2016/02/best-way-to-store-dotfiles-git-bare-repo/
alias dot='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'

# Aliases
alias vim='nvim'
alias psgrep='ps aux | grep '
alias tx='tmuxinator'

function findall() {
  find . -name "*" -type f | xargs grep "$1"
}

# Git
alias g="git"
alias gf="git flow"
alias wip="git commit -am'WIP'"

# Mutt
alias m="LOCAL_CONFIG=personal neomutt"
alias mw="LOCAL_CONFIG=work neomutt"

# pip
alias pipup="pip freeze --local | grep -v '^\-e' | cut -d = -f 1  | xargs pip install -U"

# PyPI
alias pypipublish="python setup.py sdist upload -r pypi"

# Django
alias msp="./manage.py shell_plus"

# git-annex
alias aadd="git annex add"
alias aget="git annex get"
alias acopy="git annex copy"
alias amove="git annex move"
alias async="git annex sync"

# Ruby
alias bis="bundle install --standalone --path .bundle"

# Rails
alias rc="bin/rails console"
alias rce="bin/rails credentials:edit"
alias rs="bin/rails server"
alias rt="bin/rails test"
alias brps="bin/rails parallel:spec"
alias respring="spring stop && spring server &>/dev/null &"

# Rails database
alias rdm='bin/rails db:migrate'
alias rdr='bin/rails db:rollback'
alias rds='bin/rails db:seed'
