#!/bin/sh

# Useful Functions
source "$ZDOTDIR/zsh-functions"

# Add custom aliases
zsh_add_file "zsh-aliases"

###################################
# Plugins (Antibody)
###################################
export NVM_COMPLETION=true
export NVM_LAZY_LOAD=true

if [ -f "$ZDOTDIR/.zsh_plugins.sh" ]; then
    source $ZDOTDIR/.zsh_plugins.sh
else
  if ! command -v "antibody" >/dev/null 
  then
    # install antibody
    echo "Installing Antibody..."
    curl -sfL git.io/antibody | sh -s - -b $HOME/.local/bin
  fi
  # bundle plugins
  antibody bundle < $ZDOTDIR/.zsh_plugins.txt > $ZDOTDIR/.zsh_plugins.sh
fi


###################################
# ZSH History
###################################
mkdir -p $HOME/.cache/zsh
export HISTFILE=$HOME/.cache/zsh/.zsh_history
export HISTSIZE=1000
export SAVEHIST=1000


###################################
# ZSH Options
###################################
setopt appendhistory incappendhistory sharehistory histfindnodups
setopt nobeep multios autocd nomatch menucomplete

# Maps zoxide fzf to Ctrl+F
bindkey -s '^F' 'zi^M'

bindkey "${terminfo[kcuu1]}" history-substring-search-up
bindkey "${terminfo[kcud1]}" history-substring-search-down

# Only run compinit once per day to improve startup latency
autoload -Uz compinit
for dump in ~/.zcompdump(N.mh+24); do
  compinit
done
compinit -C

# Allow lowercase to match uppercase
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'

# Use arrow keys to navigate completion menu
zstyle ':completion:*' menu select


###################################
# Zoxide
###################################
if [ ! command -v zoxide &> /dev/null ]; then
  echo "Installing Zoxide..."
  curl -sS https://webinstall.dev/zoxide | bash
fi
eval "$(zoxide init zsh)" # must be called after `compinit`

###################################
# Pure Prompt
###################################
PURE_DIR="$HOME/git/programs/pure"

# Download Pure prompt if it doesn't exist.
if [ ! -d "$PURE_DIR" ]; then
  echo "Downloading Pure prompt..."
  git clone https://github.com/sindresorhus/pure.git "$PURE_DIR"
  echo "Done."
fi

fpath+=($PURE_DIR)
autoload -U promptinit; promptinit
prompt pure