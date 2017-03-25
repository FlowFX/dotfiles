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
alias ptc="pytest --cov --cov-report html"

# Django
alias mrs="./manage.py runserver"
alias msp="./manage.py shell_plus"
alias mmm="./manage.py makemessages -l es -l en"
alias mcm="./manage.py compilemessages -l es -l en --use-fuzzy"

# pip
alias pipup="pip freeze --local | grep -v '^\-e' | cut -d = -f 1  | xargs pip install -U"
