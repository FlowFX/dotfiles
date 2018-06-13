# Aliases
alias vim='nvim'
alias psgrep='ps aux | grep '

function findall() {
  find . -name "*" -type f | xargs grep "$1"
}

# Git
alias g="git"
alias wip="git commit -am'WIP'"

# todo.txt
export TODOTXT_DEFAULT_ACTION=ls
alias t="todo.sh"
alias ted="vim ~/todo.txt"

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
alias rc="rails console"
alias rs="rails server"
alias rt="rails test"

# Rails database
alias rdm='rails db:migrate'
alias rds='rails db:seed'
