#!/bin/zsh

export EDITOR=/usr/bin/vim
# teamocil: tmux session manager
export TEAMOCIL_PATH=$HOME/.tmux/teamocil/
compctl -g '~/.tmux/teamocil/*(:t:r)' teamocil

# virtualenvwrapper settings
export WORKON_HOME=$HOME/.envs
export VIRTUALENVWRAPPER_LOG_DIR="$WORKON_HOME"
export VIRTUALENVWRAPPER_HOOK_DIR="$WORKON_HOME"
export VIRTUALENVWRAPPER_VIRTUALENV=/usr/bin/virtualenv

export VAGRANT_HOME=/media/mesuutt/devil/Development/os/vagrant/.vagrant.d/


if [ -d $HOME/.bin ]; then
   path+=($HOME/.bin)
fi

# Set PATH/path to be unique
typeset -U path


# Colorful man pages
# Ertug Karamatli <ertug@karamatli.com>  http://wiki.clug.org.za/wiki/Colour_on_the_command_line

export LESS_TERMCAP_mb=$'\E[01;31m'
export LESS_TERMCAP_md=$'\E[01;31m'
export LESS_TERMCAP_me=$'\E[0m'
export LESS_TERMCAP_se=$'\E[0m'
export LESS_TERMCAP_so=$'\E[01;44;33m'
export LESS_TERMCAP_ue=$'\E[0m'
export LESS_TERMCAP_us=$'\E[01;32m'
