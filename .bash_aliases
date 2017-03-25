# Aliases

# Git
alias g="git"

# todo.txt
export TODOTXT_DEFAULT_ACTION=ls
alias t="todo.sh"
alias ted="vim ~/todo.txt"

# tox & pytest
alias dt="tox"
alias f8="flake8"
alias pt="pytest"
alias ptf="pytest functional_tests"

# pip
alias pipup="pip freeze --local | grep -v '^\-e' | cut -d = -f 1  | xargs pip install -U"
