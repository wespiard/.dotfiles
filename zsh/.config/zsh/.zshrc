#!/bin/sh
#
# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.config/zsh/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# install zoxide
if [ ! $(command -v "zoxide") ];
then 
  echo "Installing Zoxide..."
  curl -sS https://webinstall.dev/zoxide | bash
fi

if ! command -v fzf &> /dev/null
then
  echo "Installing fzf..."
  cd $TEMPDIR
  wget https://github.com/junegunn/fzf/releases/download/0.28.0/fzf-0.28.0-linux_amd64.tar.gz
  tar xf fzf-0.28.0-linux_amd64.tar.gz --directory $INSTALL_DIR/bin
fi

if ! command -v lazygit &> /dev/null
then
  echo "Installing lazygit..."
  cd $TEMPDIR
  wget https://github.com/jesseduffield/lazygit/releases/download/v0.31.4/lazygit_0.31.4_Linux_x86_64.tar.gz
  tar xf lazygit_0.31.4_Linux_x86_64.tar.gz --directory $INSTALL_DIR/bin
fi

# Maps zoxide fzf to Ctrl+F
bindkey -s '^f' 'zi^M'

# Useful Functions
source "$ZDOTDIR/zsh-functions"

# Normal files to source
zsh_add_file "zsh-exports"
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


# zsh_history
setopt SHARE_HISTORY
setopt HIST_FIND_NO_DUPS

# some useful options (man zshoptions)
setopt auto_cd nomatch menucomplete

# beeping is annoying
unsetopt BEEP

# load functions
autoload -Uz up-line-or-beginning-search
autoload -Uz down-line-or-beginning-search
zle -N up-line-or-beginning-search
zle -N down-line-or-beginning-search

# start typing + [Up-Arrow] - fuzzy find history forward
bindkey "${terminfo[kcuu1]}" up-line-or-beginning-search

# start typing + [Down-Arrow] - fuzzy find history backward
bindkey "${terminfo[kcud1]}" down-line-or-beginning-search


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

# Install lazygit
conda install -c conda-forge lazygit

# To customize prompt, run `p10k configure` or edit ~/.config/zsh/.p10k.zsh.
[[ ! -f ~/.config/zsh/.p10k.zsh ]] || source ~/.config/zsh/.p10k.zsh
