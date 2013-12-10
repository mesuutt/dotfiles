#!/usr/bin/env zsh

alias h='howdoi'

alias http='noglob http'
alias git='noglob git'
alias find='noglob find'
alias pip='noglob pip'


# Arch linux specific aliases
alias y='yaourt'

trqalt() {
    setxkbmap tr alt caps:ctrl_modifier
    # Look at /usr/share/X11/xkb/rules/base.lst for all options
}

trq() {
    setxkbmap tr '' caps:ctrl_modifier
}
