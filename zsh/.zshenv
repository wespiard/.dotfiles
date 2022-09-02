export EDITOR="nvim"

export ZDOTDIR=$HOME/.config/zsh

export XDG_CONFIG_HOME=$HOME/.config
export XDG_CACHE_HOME=$HOME/.cache
export XDG_DATA_HOME=$HOME/.local/share
export XDG_STATE_HOME=$HOME/.local/state

export CARGO_HOME=/home/wes/.rustup
export RUSTUP_HOME=/home/wes/.cargo/bin

typeset -U path # make sure PATH doesn't get duplicate entries
# path=(~/.local/bin $path)
path=($CARGO_HOME $path)

export PATH
