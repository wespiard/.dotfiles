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

if ! command -v "antibody" >/dev/null 
then
  # install antibody
  echo "Installing Antibody..."
  curl -sfL git.io/antibody | sh -s - -b $HOME/.local/bin
fi

if [ ! -f "$ZDOTDIR/.zsh_plugins.sh" ]; then
  # bundle plugins
  antibody bundle < $ZDOTDIR/.zsh_plugins.txt > $ZDOTDIR/.zsh_plugins.sh
fi

source $ZDOTDIR/.zsh_plugins.sh

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
setopt nobeep multios autocd menucomplete

# Maps zoxide fzf to Ctrl+F
bindkey -s '^F' 'zi^M'

bindkey "^N" history-substring-search-up
bindkey "^P" history-substring-search-down
# bindkey "${terminfo[kcuu1]}" history-substring-search-up
# bindkey "${terminfo[kcud1]}" history-substring-search-down

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
if ! command -v "zoxide" >/dev/null 
then
  echo "Installing Zoxide..."
  curl -sS https://webinstall.dev/zoxide | bash >/dev/null 
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


# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('$HOME/.miniconda/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "$HOME/.miniconda/etc/profile.d/conda.sh" ]; then
        . "$HOME/.miniconda/etc/profile.d/conda.sh"
    else
        export PATH="$HOME/.miniconda/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<
