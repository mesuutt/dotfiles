#!/usr/bin/env zsh
gito() {
    # git outside working dir
    # gito <repo-dir> status 
    git --git-dir=$PWD/$1/.git --work-tree=$PWD/$1 $2
}
