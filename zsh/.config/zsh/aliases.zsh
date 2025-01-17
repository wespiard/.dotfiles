
alias nvrc='nvim ~/.config/nvim/'
alias nvzs='nvim $HOME/.zshrc' 
alias zs='source $HOME/.zshrc'

alias md='mkdir -p'

# Colorize grep output (good for log files)
alias grep='grep --color=auto'
alias egrep='egrep --color=auto'
alias fgrep='fgrep --color=auto'

# confirm before overwriting something
alias cp="cp -i"
alias mv='mv -i'
alias rm='rm -i'

# ls shortcuts
alias ls='ls --color=auto'
#alias l='ls -oFA --color=auto --group-directories-first'
alias l='eza -l --group-directories-first --icons'
alias la='eza -la --group-directories-first --icons'
alias lt='eza -l --group-directories-first --icons --git-ignore --tree --level'
alias lta='eza -la --group-directories-first --icons --git-ignore --ignore-glob=.git --tree --level'
alias t='eza --group-directories-first --icons --git-ignore --tree'
alias tt='eza --group-directories-first --icons --git-ignore --tree --level'
alias ta='eza -a --group-directories-first --icons --git-ignore --ignore-glob=.git --tree'
alias tta='eza -a --group-directories-first --icons --git-ignore --ignore-glob=.git --tree --level'

# easier to read disk
alias df='df -h'     # human-readable sizes
alias free='free -m' # show sizes in MB

# get top process eating memory
alias psmem='ps auxf | sort -nr -k 4 | head -5'

# get top process eating cpu ##
alias pscpu='ps auxf | sort -nr -k 3 | head -5'


# Git
alias g='lazygit'

alias gr='cd $(git rev-parse --show-toplevel)'

alias ga='git add'
alias gaa='git add --all'
alias gac='git add --all && git commit -v'

alias gst='git status -u --short'
alias gstu='git status -u'

alias gb='git branch'
alias gba='git branch -a'
alias gbd='git branch -d'
alias gbda='git branch --no-color --merged | command grep -vE "^([+*]|\s*($(git_main_branch)|$(git_develop_branch))\s*$)" | command xargs git branch -d 2>/dev/null'
alias gbD='git branch -D'
alias gbl='git blame -b -w'

alias gc='git commit -v'
alias gc!='git commit -v --amend'
alias gcn!='git commit -v --no-edit --amend'
alias gca='git commit -v -a'
alias gca!='git commit -v -a --amend'
alias gcan!='git commit -v -a --no-edit --amend'
alias gcm='git commit -m'
alias gcam='git commit -a -m'

alias gcf='git config --list'

alias gcl='git clone --recurse-submodules'
alias gclean='git clean -id'
alias gpristine='git reset --hard && git clean -dffx'
alias gco='git checkout'
alias gcb='git checkout -b'
alias gcor='git checkout --recurse-submodules'
alias gcount='git shortlog -sn'
alias gcp='git cherry-pick'
alias gcpa='git cherry-pick --abort'
alias gcpc='git cherry-pick --continue'

alias gd='git diff'
alias gdca='git diff --cached'
alias gdcw='git diff --cached --word-diff'
alias gdct='git describe --tags $(git rev-list --tags --max-count=1)'
alias gds='git diff --staged'
alias gdt='git diff-tree --no-commit-id --name-only -r'
alias gdup='git diff @{upstream}'
alias gdw='git diff --word-diff'

alias gf='git fetch'
alias gfo='git fetch origin'

alias gpl='git pull'
alias gps='git push'

alias gfg='git ls-files | grep'
