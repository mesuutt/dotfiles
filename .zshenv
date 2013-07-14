#!/bin/zsh

# teamocil: tmux session manager
export TEAMOCIL_PATH=$HOME/.tmux/teamocil/
compctl -g '~/.tmux/teamocil/*(:t:r)' teamocil

# virtualenvwrapper settings
export WORKON_HOME=$HOME/.envs
export VIRTUALENVWRAPPER_LOG_DIR="$WORKON_HOME"
export VIRTUALENVWRAPPER_HOOK_DIR="$WORKON_HOME"
export VAGRANT_HOME=/media/mesuutt/devil/Development/os/vagrant/.vagrant.d/


if [ -d $HOME/.bin ]; then
   path+=($HOME/.bin)
fi

# Set PATH/path to be unique
typeset -U path
