#!/bin/sh

# Useful Functions
source "$ZDOTDIR/zsh-functions"

# Normal files to source
zsh_add_file "zsh-aliases"

# Plugins (Antibody)
if [ -f "$ZDOTDIR/.zsh_plugins.sh" ]; then
    source $ZDOTDIR/.zsh_plugins.sh
else
  if ! command -v "antibody"
  then
    # install antibody
    echo "Installing Antibody..."
    curl -sfL git.io/antibody | sh -s - -b $HOME/.local/bin
  fi
    # bundle plugins
    antibody bundle < $ZDOTDIR/.zsh_plugins.txt > $ZDOTDIR/.zsh_plugins.sh
fi

###################################
# Zoxide
###################################
if [ ! command -v zoxide &> /dev/null ]; then
  echo "Installing Zoxide..."
  curl -sS https://webinstall.dev/zoxide | bash
fi

eval "$(zoxide init zsh)"

# Maps zoxide fzf to Ctrl+F
bindkey -s '^F' 'zi^M'


# create directory for .zsh_history file, if it doesn't exist
mkdir -p $HOME/.cache/zsh
export HISTFILE=$HOME/.cache/zsh/.zsh_history
export HISTSIZE=1000
export SAVEHIST=1000


###################################
# ZSH Options
###################################
setopt appendhistory incappendhistory sharehistory histfindnodups
setopt nobeep multios autocd nomatch menucomplete

# vi mode
# bindkey -v
# export KEYTIMEOUT=1

autoload -Uz compinit
compinit
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'
# zstyle ':completion:*' menu select


# load functions
# autoload -Uz up-line-or-beginning-search
# autoload -Uz down-line-or-beginning-search
# zle -N up-line-or-beginning-search
# zle -N down-line-or-beginning-search

# start typing + [Up-Arrow] - fuzzy find history forward
bindkey "${terminfo[kcuu1]}" history-substring-search-up
# bindkey "${terminfo[kcuu1]}" up-line-or-beginning-search

# start typing + [Down-Arrow] - fuzzy find history backward
bindkey "${terminfo[kcud1]}" history-substring-search-down
# bindkey "${terminfo[kcud1]}" down-line-or-beginning-search
