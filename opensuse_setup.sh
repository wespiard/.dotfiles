#!/bin/bash

# Check if script executed as root.
if [ "$UID" -ne 0 ]; then
  echo 'You must be root to execute this script.'
  return
fi

clear
echo ''
echo '-------------------------------------------'
echo ' openSUSE Post-installation Setup Script '
echo '-------------------------------------------'

# DETECT DISTRIBUTION
ID=$(cat /etc/os-release | grep ^ID= | tr -d [A-Z][='"'] | sed 's/-.*//')

case $ID in
  opensuse )
    echo "Detected openSUSE distribution."
    echo "Updating packages in Zypper."
    zypper refresh &> /dev/null
    zypper update -y &> /dev/null
    zypper install -y gcc gcc-c++ &> /dev/null
    zypper install -y zsh git stow fzf fzf-zsh-completion cmake &> /dev/null
    zypper install -y ripgrep ripgrep-zsh-completion fd fd-zsh-completion exa &> /dev/null
    ;;
  * )
    echo "Unknown distribution!"
    exit
    ;;
esac

DOTS=$HOME/.dotfiles

# Pull dotfiles repo
git clone https://github.com/wespiard/.dotfiles.git $DOTS &> /dev/null

# Remove existing dotfiles
rm -rf $HOME/.gitconfig $HOME/.tmux.conf $HOME/.config/zsh $HOME/.zshrc

cd $DOTS

# Stow dotfiles to $HOME directory
echo "Stowing dotfiles to $HOME directory."
stow zsh git tmux wez lazygit

# install rust
if [ ! -v cargo ];
then
    echo "Installing Rust..."
    curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- --no-modify-path -y -q
else
    echo "Rust is already installed."
fi

# install lazygit
echo "Installing LazyGit..."
LAZYGIT_VERSION=$(curl -s "https://api.github.com/repos/jesseduffield/lazygit/releases/latest" | grep -Po '"tag_name": "v\K[0-35.]+')
curl -Lo lazygit.tar.gz "https://github.com/jesseduffield/lazygit/releases/latest/download/lazygit_${LAZYGIT_VERSION}_Linux_x86_64.tar.gz"
tar xf lazygit.tar.gz -C $HOME/.local/bin lazygit
rm -rf lazygit.tar.gz

echo ""
echo "-------------------------------------------"


CONDA_DIR=$HOME/.miniconda

if [ ! -d $CONDA_DIR ];
then
    echo "Installing Miniconda..."
    curl -sLO https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh &> /dev/null

    # -b flag runs installer in batch mode without user interaction
    bash Miniconda3-latest-Linux-x86_64.sh -b -p $CONDA_DIR &> /dev/null
    rm -f Miniconda3-latest-Linux-x86_64.sh
else
    echo "Miniconda is already installed."
fi

echo "-------------------------------------------"

chsh -s $(which zsh)

exit

echo ''

