# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="powerline"

# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# Set to this to use case-sensitive completion
# CASE_SENSITIVE="true"

# Comment this out to disable weekly auto-update checks
# DISABLE_AUTO_UPDATE="true"

# Uncomment following line if you want to disable colors in ls
# DISABLE_LS_COLORS="true"

# Uncomment following line if you want to disable autosetting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment following line if you want red dots to be displayed while waiting for completion
# COMPLETION_WAITING_DOTS="true"

# ssh-agent forwarding
zstyle :omz:plugins:ssh-agent agent-forwarding on

# screen auto-start
# zstyle :omz:plugins:screen auto-start on

# tmux auto-start
zstyle :omz:plugins:tmux auto-start on

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(git django extract history-substring-search npm python ssh-agent \
    sublime tmux urltools autojump command-not-found virtualenvwrapper tux \
    git-flow zsh-syntax-highlighting
    vagrant, archlinux)

source $ZSH/oh-my-zsh.sh

setopt histignorespace

# Disable auto correct
unsetopt correct_all

#z - autojump alternative
test ~/.bin/z.sh && source ~/.bin/z.sh

test ~/.bin/functions.sh && source ~/.bin/functions.sh


# Load virtualenvwrapper settings
# Moved to .zshenv

# Kill tmux session and all processes which started in the session
# when terminal window closed
alias tmuxn='tmux new-session -s $$'
_trap_exit() { tmux kill-session -t $$; }
trap _trap_exit EXIT

# Run tmux when open terminal
[[ $TERM = "xterm" ]] && { tmuxn }

# zsh powerline theme settings https://github.com/jeremyFreeAgent/oh-my-zsh-powerline-theme
POWERLINE_HIDE_USER_NAME="true"
POWERLINE_HIDE_HOST_NAME="true"
POWERLINE_DETECT_SSH="true"
POWERLINE_RIGHT_A="exit-status"
