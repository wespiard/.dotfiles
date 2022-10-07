# This file is loaded once at the start of a login shell.

# Tells which editor to use when a program wants to launch one.
export EDITOR="nvim"

# Sets XDG variables, which is a standard for telling programs where to store
# config, cache, and shared data files.
export XDG_CONFIG_HOME=$HOME/.config
export XDG_CACHE_HOME=$HOME/.cache
export XDG_DATA_HOME=$HOME/.local/share
export XDG_STATE_HOME=$HOME/.local/state

# Variables that dictate where rust tools are installed and executed from.
export RUSTUP_HOME=$HOME/.rustup
export CARGO_HOME=$HOME/.cargo

# Use Zsh arrays to prepend to path variable without duplicates.
typeset -U path
path=( $HOME/.local/bin $RUSTUP_HOME $CARGO_HOME/bin $path)
export LD_LIBRARY_PATH=$HOME/.local/lib:$LD_LIBRARY_PATH
export LIBRARY_PATH=$HOME/.local/lib:$LIBRARY_PATH

