#!/bin/sh

DOTFILES=`cd $(dirname $0); pwd`

for FILE in $DOTFILES/*; do
    NAME=`basename $FILE`
    if [ $NAME == 'bin' ]; then
        TARGET=$HOME/bin
    else
        TARGET=$HOME/.$NAME
    fi

    if [ $NAME != 'install.sh' ]; then
        if [ -L $TARGET ]; then
            echo "$TARGET exists"
        else
            ln -vsf $FILE $TARGET
        fi
    fi
done