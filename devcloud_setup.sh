#!/bin/sh

clear
echo ''
echo '-------------------------------------------'
echo ' DevCloud Setup Script '
echo '-------------------------------------------'


echo '------------ Installing Zsh ---------------'
curl https://raw.githubusercontent.com/romkatv/zsh-bin/master/install -s | bash -s -- -d $HOME/.local -e no

echo '------------ Installing Rust --------------'
curl https://sh.rustup.rs -sSf | sh -s -- -y --no-modify-path
source "$HOME/.cargo/env"
cargo install exa du-dust fd-find ripgrep

echo '-------- Adding Dotfile Symlinks ----------'
# remove existing dotfiles if they exist
rm -rf $HOME/.config/zsh $HOME/.zshrc $HOME/.config/nvim
stow zsh nvim

echo '----------- Installing Rust --------------'
# install lazygit
LAZYGIT_VERSION=$(curl -s "https://api.github.com/repos/jesseduffield/lazygit/releases/latest" | grep -Po '"tag_name": "v\K[0-35.]+')
curl -Lo lazygit.tar.gz "https://github.com/jesseduffield/lazygit/releases/latest/download/lazygit_${LAZYGIT_VERSION}_Linux_x86_64.tar.gz"
tar xf lazygit.tar.gz -C $HOME/.local/bin lazygit
rm -rf lazygit.tar.gz
