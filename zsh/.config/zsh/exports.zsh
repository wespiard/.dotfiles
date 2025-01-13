# Tells which editor to use when a program wants to launch one.
export EDITOR="nvim"

# Sets XDG variables, which is a standard for telling programs where to store
# config, cache, and shared data files.
export XDG_CONFIG_HOME=$HOME/.config
export XDG_CACHE_HOME=$HOME/.cache
export XDG_DATA_HOME=$HOME/.local/share
export XDG_STATE_HOME=$HOME/.local/state

###################################
# ZSH History
###################################
mkdir -p $HOME/.cache/zsh
export HISTFILE=$HOME/.cache/zsh/.zsh_history
export HISTSIZE=1000
export SAVEHIST=1000

export PATH="$HOME/.local/opt/nvim/bin:$PATH"
