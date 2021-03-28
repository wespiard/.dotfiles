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

5. Clone dotfiles repo from GitLab (if not already cloned)

```console
git clone git@gitlab.com:wespiard/dotfiles.git
```

6. Remove the default .zshrc file, and symblink to the .zshrc within the dotfiles repo. Make sure the path in 'ln' command properly points to your dotfiles repo path. 

```console
rm ~/.zshrc
ln -s ~/git/dotfiles/.zshrc ~/.zshrc 
```