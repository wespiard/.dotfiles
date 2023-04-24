# export ZDOTDIR=$HOME/.config/zsh

. "$HOME/.cargo/env"
. "$HOME/.config/zsh/aliases.zsh"
. "$HOME/.config/zsh/exports.zsh"

###################################
# ZSH Options
###################################
setopt appendhistory incappendhistory sharehistory histfindnodups
setopt nobeep multios menucomplete

# Maps zoxide fzf to Ctrl+F
bindkey -s '^F' 'zi^M'

# Enable VIM mode
bindkey -v

# Start typing a command, then use up/down arrows to see history matches
# TODO: check OS to determine which 
bindkey "${terminfo[kcuu1]}" history-substring-search-up
bindkey "${terminfo[kcud1]}" history-substring-search-down
bindkey '^[[A' history-substring-search-up
bindkey '^[[B' history-substring-search-down

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

# Initialize Starship prompt
eval "$(starship init zsh)"

