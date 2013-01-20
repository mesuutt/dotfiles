# --- PERSONAL SETTINGS ---

export PS1='\[\033[01;33m\][`date +'%H:%M'`]\[\033[01;31m\](\[\033[00;37m\]\u@\h \w\[\033[01;31m\])\[\033[00m\]\$ '

export EDITOR="vim"
export VISUAL="vim"

# History Settings
export HISTCONTROL="ignoreboth"
export HISTSIZE="10000"

export PROMPT_DIRTRIM=3

# ls colors
export LSCOLORS=ExFxCxDxBxegedabagacad

# Extending PATH
export PATH="$PATH:$HOME/.bin"

# Settings for Python
export PYTHONPATH="$PYTHONPATH:$HOME/projects:$HOME/Projects"
export PYTHONSTARTUP="$HOME/.pythonrc"

# include aliases
if [[ -f "$HOME/.bash_aliases" ]]; then
    . $HOME/.bash_aliases
fi

# I am keeping symbolic links and special scripts in .bin directory
if [ -d ~/.bin ]; then
  PATH=$PATH:~/.bin
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
# fi

# store screen pid
if [[ -n "$STY" ]]; then
    echo "$STY" > "$SCREEN_INFO"
fi

# --- SSH Agent ---

source "$HOME/.ssh/functions.sh"

if isLinux && ! is_ssh_running; then
    create_agent
    add_keys
fi
