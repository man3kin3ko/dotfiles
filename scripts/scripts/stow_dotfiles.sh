#!/bin/bash

IGNORE='other_locations'

cd ~/.dotfiles
for d in */ ; do
    if [ $d != $IGNORE ]
    then
        stow "$d";
    fi
done
