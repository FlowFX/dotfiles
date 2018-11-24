# Store dotfiles in a bare repository
# https://developer.atlassian.com/blog/2016/02/best-way-to-store-dotfiles-git-bare-repo/
alias dot='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'

# Aliases
alias vim='nvim'
alias psgrep='ps aux | grep '

function findall() {
  find . -name "*" -type f | xargs grep "$1"
}

# Git
alias g="git"
alias gf="git flow"
alias wip="git commit -am'WIP'"

# Mutt
alias m="neomutt"

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

# Rails
alias beg="bundle exec guard"
alias ber="bundle exec rspec"
alias berp="bundle exec rails parallel:spec RAILS_ENV=test"
alias rc="bundle exec rails console"
alias rs="bundle exec rails server"
alias rt="bundle exec rails test"
alias respring="spring stop && spring server &>/dev/null &"

# Rails database
alias rdm='rails db:migrate'
alias rds='rails db:seed'
