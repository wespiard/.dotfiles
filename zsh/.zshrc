ZAP_DIR="$HOME/.local/share/zap"

# If Zap directory doesn't exist, install it with git.
[[ ! -d "$ZAP_DIR" ]] && git clone --depth 1 -b release-v1 https://github.com/zap-zsh/zap $ZAP_DIR > /dev/null



# Created by Zap installer
[ -f "$HOME/.local/share/zap/zap.zsh" ] && source "$HOME/.local/share/zap/zap.zsh"
plug "lukechilds/zsh-nvm"
plug "zsh-users/zsh-autosuggestions"
plug "zap-zsh/supercharge"
plug "zsh-users/zsh-history-substring-search"
plug "zsh-users/zsh-syntax-highlighting"
plug "MichaelAquilina/zsh-you-should-use"
plug "zsh-users/zsh-completions"
# plug "zap-zsh/zap-prompt"

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

plug $HOME/.config/zsh/custom.zsh

# Generated for envman. Do not edit.
[ -s "$HOME/.config/envman/load.sh" ] && source "$HOME/.config/envman/load.sh"

