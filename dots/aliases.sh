#!/usr/bin/env sh

# Common shell free aliases.

alias h='howdoi'

alias gn="git annex"
alias pkg-update='sudo etckeeper pre-install && sudo pacman -Syu && sudo etckeeper post-install'

alias y='yaourt'
alias t="task"

alias cp="cp --preserve=all"

# Advenced copy. Show progressbar while copiying/moving files
alias acp="/usr/local/bin/cp -g"
alias amv="/usr/local/bin/mv -g"

alias cheat="python3 /usr/bin/cheat"

psg(){
    ps -aux | grep "$*";
}


alias a='fasd -a'        # any
alias s='fasd -si'       # show / search / select
alias d='fasd -d'        # directory
alias f='fasd -f'        # file
alias sd='fasd -sid'     # interactive directory selection
alias sf='fasd -sif'     # interactive file selection
alias z='fasd_cd -d'     # cd, same functionality as j in autojump
alias zz='fasd_cd -d -i' # cd with interactive selection
alias v='f -e vim'       # quick opening files with vim

alias gf='git fetch'
alias gp='git pull'
alias gc='git commit -m '
alias gs='git status'
alias ga='git add -p'
alias gr='git reset .'

alias sp='snipper'
alias s='ag -nr'
