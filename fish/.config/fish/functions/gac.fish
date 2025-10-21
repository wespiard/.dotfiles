function gac --wraps='git add --all && git commit -v' --description 'alias gac=git add --all && git commit -v'
    git add --all && git commit -v $argv
end
