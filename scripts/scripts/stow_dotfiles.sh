#!/bin/bash

IGNORE='chrootit/'

cd ~/.dotfiles
for d in */ ; do
    if [ $d != $IGNORE ]
    then
        stow "$d";
    fi
done
