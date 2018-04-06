# Aliases

alias psgrep='ps aux | grep '

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
