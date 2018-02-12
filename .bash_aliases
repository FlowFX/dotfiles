# Aliases

# Git
alias g="git"
alias wip="git commit -am'WIP'"

workstart(){
    git fetch origin
    git checkout -b "issue$1" origin/master
}

workdone() {
    git checkout master
    git branch -D "issue$1"
    git push origin :"issue$1"
}

alias ws=workstart
alias wd=workdone

# todo.txt
export TODOTXT_DEFAULT_ACTION=ls
alias t="todo.sh"
alias ted="vim ~/todo.txt"

# tox & pytest
alias dt="tox"
alias f8="flake8"
alias pt="pytest --ds=config.settings.testing"
alias ptf="pytest --ds=config.settings.testing functional_tests"
alias ptc="pytest --ds=config.settings.testing --cov --cov-report html"
alias pyunit="pytest --sw -k \"not system_\""
alias pysys="pytest --sw -k system_"
alias pl="pylint -j 4 lexa tests"

# Django
alias mrs="./manage.py runserver_plus -6 --settings config.settings.local --extra-file lexa/core/static/css/bootstrap/bootstrap.css; browser-sync --proxy 'localhost' --files '.' --port 8000"
alias msp="./manage.py shell_plus"
alias mmm="(cd ~/code/lexa/src/lexa/ && django-admin makemessages -l es -l en)"
alias mcm="(cd ~/code/lexa/src/lexa/ && django-admin compilemessages -l es -l en)"
alias css="./manage.py compilescss"

# pip
alias pipup="pip freeze --local | grep -v '^\-e' | cut -d = -f 1  | xargs pip install -U"

# PyPI
alias pypipublish="python setup.py sdist upload -r pypi"
