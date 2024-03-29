#!/bin/bash

# Check if script executed as root.
if [ "$UID" -ne 0 ]; then
  echo 'You must be root to execute this script.'
  return
fi

clear
echo ''
echo '-------------------------------------------'
echo ' Linux Post-installation Setup Script '
echo '-------------------------------------------'

# DETECT DISTRIBUTION
ID=$(cat /etc/os-release | grep ^ID= | tr -d [A-Z][='"'] | sed 's/-.*//')

case $ID in
  opensuse )
    echo "Detected openSUSE distribution."
    echo "Updating packages in Zypper."
    zypper refresh &> /dev/null
    zypper update -y &> /dev/null
    zypper install -y gcc gcc-c++
    zypper install -y zsh git stow exa fzf fzf-zsh-completion cmake
    zypper install -y ripgrep fd
    ;;
  ubuntu )
    echo "Detected Ubuntu distribution."
    echo "Updating packages."
    apt update && apt upgrade -y
    apt install -y build-essential libssl-dev
    apt install -y ninja-build gettext libtool libtool-bin autoconf automake cmake g++ pkg-config unzip curl doxygen
    mkdir $HOME/git && cd $HOME/git
    git clone https://github.com/neovim/neovim
    cd neovim
    git checkout release-0.7
    make CMAKE_BUILD_TYPE=RelWithDebInfo
    make CMAKE_INSTALL_PREFIX=$HOME/.local install
    cd ..
    apt install -y zsh git stow exa
    curl -sS https://webinstall.dev/zoxide | bash
    chsh -s $(which zsh)
    ;;
  * )
    echo "Unknown distribution!"
    exit
    ;;
esac


INSTALL_DIR=$HOME/.local
PATH=$PATH:$INSTALL_DIR/bin

# Remove existing dotfiles
rm -rf $HOME/.gitconfig $HOME/.tmux.conf $HOME/.config/zsh $HOME/.zshrc

# Stow dotfiles to $HOME directory
echo "Stowing dotfiles to $HOME directory."
stow zsh git tmux nvim wez

# install rust
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- --no-modify-path -y -q

# install lazygit
LAZYGIT_VERSION=$(curl -s "https://api.github.com/repos/jesseduffield/lazygit/releases/latest" | grep -Po '"tag_name": "v\K[0-35.]+')
curl -Lo lazygit.tar.gz "https://github.com/jesseduffield/lazygit/releases/latest/download/lazygit_${LAZYGIT_VERSION}_Linux_x86_64.tar.gz"
tar xf lazygit.tar.gz -C $HOME/.local/bin lazygit
rm -rf lazygit.tar.gz

chsh -s $(which zsh)

exit

echo ''

