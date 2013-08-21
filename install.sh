#!/bin/bash

# Install oh-my-zsh
if [ ! -d ~/.oh-my-zsh ]; then
    git clone https://github.com/robbyrussell/oh-my-zsh.git ~/.oh-my-zsh
fi

# Install emacs.d
if [ ! -d ~/.emacs.d ]; then
    git clone https://github.com/walkah/emacs.d.git ~/.emacs.d
fi

DOTFILES=`cd $(dirname $0)/home; pwd`

for FILE in `ls -a $DOTFILES`; do
    NAME=`basename $FILE`
    TARGET=$HOME/$NAME

    if [ $NAME != '.' ] && [ $NAME != '..' ]; then
        if [ -L $TARGET ]; then
            echo "$TARGET exists"
        else
            ln -vsf $FILE $TARGET
        fi
    fi
done
