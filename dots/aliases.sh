#!/usr/bin/env sh

# Common shell free aliases.

alias h='howdoi'

alias gap='git add -p'
alias gn="git annex"
alias pkg-update='sudo etckeeper pre-install && sudo pacman -Syu && sudo etckeeper post-install'

alias y='yaourt'

alias vup="vagrant up"
alias vsh="vagrant ssh"
alias vsp="vagrant suspend"
alias vst="vagrant status"
alias vsr="vagrant reload"

alias t="todo.sh"

psg(){
    ps -aux | grep "$*";
}

