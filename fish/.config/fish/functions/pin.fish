function pin --wraps='sudo pacman -S' --description 'alias pin=sudo pacman -S'
    sudo pacman -S $argv
end
