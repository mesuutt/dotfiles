# --- PERSONAL SETTINGS ---

export PS1='\[\033[01;33m\][`date +'%H:%M'`]\[\033[01;31m\](\[\033[00;37m\]\u@\h \w\[\033[01;31m\])\[\033[00m\]\$ '

export EDITOR="vim"
export VISUAL="vim"

# History Settings
export HISTCONTROL="ignoreboth"
export HISTSIZE="10000"

export PROMPT_DIRTRIM=2

# ls colors
export LSCOLORS=ExFxCxDxBxegedabagacad

# Settings for Python
export PYTHONDONTWRITEBYTECODE="1"
export PYTHONSTARTUP="$HOME/.pythonrc"

if [[ -f "$HOME/.bash_aliases" ]]; then
    source $HOME/.bash_aliases
fi

# Extending PATH
if [ -d ~/.bin ]; then
  export PATH=$PATH:~/.bin
fi

# --- POST ---

# Additional Functions
ADDITIONAL_FUNCTIONS="$HOME/.bin/functions.sh"
test -f $ADDITIONAL_FUNCTIONS && source $ADDITIONAL_FUNCTIONS
