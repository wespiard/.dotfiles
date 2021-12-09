#!/bin/sh
#
# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.config/zsh/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# zsh_history
setopt SHARE_HISTORY

# some useful options (man zshoptions)
#setopt autocd extendedglob nomatch menucomplete
# Disable ctrl-s to freeze terminal.

#stty stop undef 

# beeping is annoying
unsetopt BEEP

# completions
#autoload -Uz compinit
#zstyle ':completion:*' menu select
# zstyle ':completion::complete:lsof:*' menu yes select
#zmodload zsh/complist
# compinit
#_comp_options+=(globdots)		# Include hidden files.
#setopt globdots


# load functions
autoload -Uz up-line-or-beginning-search
autoload -Uz down-line-or-beginning-search
zle -N up-line-or-beginning-search
zle -N down-line-or-beginning-search

# start typing + [Up-Arrow] - fuzzy find history forward
bindkey "${terminfo[kcuu1]}" up-line-or-beginning-search

# start typing + [Down-Arrow] - fuzzy find history backward
bindkey "${terminfo[kcud1]}" down-line-or-beginning-search

# Colors
#autoload -Uz colors && colors

# Useful Functions
source "$ZDOTDIR/zsh-functions"

# Normal files to source
zsh_add_file "zsh-exports"
zsh_add_file "zsh-aliases"


# Plugins
source $ZDOTDIR/.zsh_plugins.sh


# Environment variables set everywhere
export EDITOR="nvim"
export TERMINAL="alacritty"

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/home/wes/.miniconda3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/home/wes/.miniconda3/etc/profile.d/conda.sh" ]; then
        . "/home/wes/.miniconda3/etc/profile.d/conda.sh"
    else
        export PATH="/home/wes/.miniconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<

# To customize prompt, run `p10k configure` or edit ~/.config/zsh/.p10k.zsh.
[[ ! -f ~/.config/zsh/.p10k.zsh ]] || source ~/.config/zsh/.p10k.zsh
