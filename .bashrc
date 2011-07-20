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
export PYTHONPATH="$PYTHONPATH:$HOME/projects"
export PYTHONSTARTUP="$HOME/.pythonrc"

# include aliases
if [[ -f "$HOME/.bash_aliases" ]]; then
    . $HOME/.bash_aliases
fi



# --- POST ---

# Additional Functions
ADDITIONAL_FUNCTIONS="$HOME/.bin/functions.sh"
test -f $ADDITIONAL_FUNCTIONS && source $ADDITIONAL_FUNCTIONS

# Open Screen
# if [[ -z "$STY" ]]; then
#     if isScreenRunning; then
#         screen -RD
#     else
#         screen
#     fi
# else
#     echo "$STY" > "$SCREEN_INFO"
# fi

# --- SSH Agent ---

source "$HOME/.ssh/functions.sh"

if isLinux && ! is_ssh_running; then
    create_agent
    add_keys
fi
