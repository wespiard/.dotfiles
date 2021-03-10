# My Custom Dotfiles


## Oh My Zsh Pure Prompt

1. Install Zsh and set as default terminal.
```console
sudo apt update
sudo apt install zsh
chsh -s $(which zsh)
```

2. Logout and back in to restart shell.
3. Install Oh My Zsh
```console
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
```

4. Follow *pure* prompt manual install instructions: https://github.com/sindresorhus/pure#manually

```console
mkdir -p "$HOME/.zsh"
git clone https://github.com/sindresorhus/pure.git "$HOME/.zsh/pure"
```

Finally, setup symlink with .zshrc file from this repo. May need to delete the one created by zsh installation. Probably best to clone the repo and do the symlink of .zshrc file before installing zsh. 