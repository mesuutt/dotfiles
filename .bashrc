if [[ $- != *i* ]]; then
	# Shell is non-interactive. Be done now
	return
fi



# --- PERSONAL SETTINGS ---

test -n "$DISPLAY" && export TERM="xterm"

export PS1='\[\033[01;33m\][`date +'%H:%M'`] \[\033[01;31m\](\[\033[00;37m\]\u@\h \W\[\033[01;31m\])\[\033[00m\]\$ '

# Locale Settings
export LANG="tr_TR.UTF-8"
export LC_ALL="tr_TR.UTF-8"
export LANGUAGE="tr_TR.UTF-8"
export LC_CTYPE="tr_TR.UTF-8"

export EDITOR="vim"
export VISUAL="vim"

# History Settings
export HISTCONTROL="ignoreboth"
export HISTSIZE="10000"

# ls colors
export LSCOLORS=ExFxCxDxBxegedabagacad

# Extending PATH
export PATH="$PATH:$HOME/.bin"

# Settings for Python
# export PYTHONPATH="$PYTHONPATH:$HOME/Projects:$HOME/Projects/vidiluck:$HOME/Projects/twity:$HOME/projects"
# export PYTHONSTARTUP="$HOME/.pythonrc"



# --- ALIASES ---

if [[ $(uname) == "Linux" ]]; then
    alias ls="ls --color"
else
    alias ls="ls -G"
fi

alias ll="ls -l"
alias la="ls -la"
alias grep="grep --color"
alias lgrep="grep --color -n"

# Set Locale to C
alias l2c="export LANG=C; export LC_ALL=C"

# Use console instead of GUI for Emacs
alias emacs="emacs -nw"

# yaourt
alias y="yaourt"



# --- POST ---

# Additional Functions
ADDITIONAL_FUNCTIONS="$HOME/.bin/functions.sh"
test -f $ADDITIONAL_FUNCTIONS && source $ADDITIONAL_FUNCTIONS

# Open Screen
if [[ -z "$STY" ]]; then
    screen -Rd
fi

# --- SSH Agent ---

source "$HOME/.ssh/functions.sh"

if isLinux && ! is_running; then
    create_agent
    add_keys
fi

