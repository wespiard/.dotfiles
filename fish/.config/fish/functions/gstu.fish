function gstu --wraps='git status -u' --description 'alias gstu=git status -u'
    git status -u $argv
end
