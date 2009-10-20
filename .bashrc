if [[ $- != *i* ]]; then
	# Shell is non-interactive. Be done now
	return
fi



# --- PERSONAL SETTINGS ---

test -n "$DISPLAY" && export TERM="xterm"

export PS1='\[\033[01;33m\][`date +'%H:%M'`] \[\033[01;31m\](\[\033[00;37m\]\u@\h \W\[\033[01;31m\])\[\033[00m\]\$ '

# Locale Settings
export LANG="tr_TR.utf8"
export LC_ALL="tr_TR.utf8"
export LANGUAGE="tr_TR.utf8"

export EDITOR="vim"
export VISUAL="vim"

# History Settings
export HISTCONTROL="ignoreboth"
export HISTSIZE="10000"



# --- BASH COMPLETIONS ---

BCD="$HOME/.bash_completion"

if [[ -d "$BCD" ]]; then
	for file in $BCD/*; do
		if [[ -f "$file" ]]; then
			source "$file"
		fi
	done
fi



# Extending PATH
export PATH="$PATH:$HOME/.bin"

# Extending MANPATH
export MANPATH="$MANPATH"

# Settings for Python
export PYTHONPATH="$PYTHONPATH:$HOME/Projects:$HOME/Projects/vidiluck:$HOME/Projects/twity"
export PYTHONSTARTUP="$HOME/.pythonrc"



# --- ALIASES ---

alias ls="ls --color"
alias ll="ls -l"
alias la="ls -la"
alias grep="grep --color -n"

# Set Locale to C
alias l2c="export LANG=C; export LC_ALL=C"

# Use console instead of GUI for Emacs
alias emacs="emacs -nw"

# use ipython instead of python
# alias python="ipython"

# yaourt
alias y="yaourt"



# --- COMMANDS ---

# ssh-agent
# if [[ -z "$SSH_AGENT_PID" && -n "$STY" ]]; then
# 	eval $(ssh-agent)
# 	ssh-add
# fi

# Open Screen
if [[ -n $DISPLAY && -z "$STY" ]]; then
	screen -Rd
fi

