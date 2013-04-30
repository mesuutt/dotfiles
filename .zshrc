# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="tux"

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
    git-flow zsh-history-substring-search zsh-syntax-highlighting
    vagrant)

source $ZSH/oh-my-zsh.sh

# Disable auto correct
unsetopt correct_all

# Exports
# Customize to your needs...
export PATH=/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/bin:/opt/X11/bin:$HOME/.bin

# virtualenvwrapper settings
export WORKON_HOME=$HOME/.envs
export VIRTUALENVWRAPPER_LOG_DIR="$WORKON_HOME"
export VIRTUALENVWRAPPER_HOOK_DIR="$WORKON_HOME"

#vagrant settings
export VAGRANT_HOME=/media/mesuutt/devil/Development/os/vagrant/.vagrant.d/


#autojump
#[[ -s ~/.autojump/etc/profile.d/autojump.zsh ]] && source ~/.autojump/etc/profile.d/autojump.zsh

#z - autojump alternative
test ~/.bin/z/z.sh && source ~/.bin/z/z.sh

# Load virtualenvwrapper settings
source /usr/local/bin/virtualenvwrapper.sh

# Run tmux when open terminal
[[ $TERM = "xterm" ]] && { tmux }

export INPUTRC=~/.inputrc
