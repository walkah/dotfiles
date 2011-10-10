#!/bin/zsh
pyflakes $1
pep8 --repeat $1
