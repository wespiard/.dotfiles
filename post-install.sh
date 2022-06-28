#!/bin/bash

# Check if script executed as root.
if [ "$UID" -ne 0 ]; then
  echo 'You must be root to execute this script.'
  exit 10
fi

clear
echo ''
echo '-------------------------------------------'
echo ' Linux Post-installation Setup Script '
echo '-------------------------------------------'

# DETECT DISTRIBUTION
ID=$(cat /etc/os-release | grep ^ID= | tr --delete [_='"'][A-Z])

case $ID in
  opensuse-leap )
    echo "Detected openSUSE distribution."
    echo "Updating packages in Zypper."
    zypper refresh &> /dev/null
    zypper update -y &> /dev/null
    zypper install -t pattern devel_basis
    zypper install -y zsh git stow exa
    ;;
  ubuntu )
    echo "Detected Ubuntu distribution."
    echo "Updating packages."
    apt update && apt upgrade -y
    apt install -y build-essential libssl-dev
    apt install -y ninja-build gettext libtool libtool-bin autoconf automake cmake g++ pkg-config unzip curl doxygen
    # wget https://github.com/Kitware/CMake/releases/download/v3.23.2/cmake-3.23.2.tar.gz
    # tar -xf cmake-3.23.2.tar.gz
    # cd cmake-3.23.2
    # ./bootstrap -- -DCMAKE_BUILD_TYPE:STRING=Release
    # make -j 4
    # make install
    # cd ../ && rm -rf cmake-3.23.2*
    git clone https://github.com/neovim/neovim
    cd neovim
    git checkout v0.7.2
    make CMAKE_BUILD_TYPE=Release -j 4
    make CMAKE_INSTALL_PREFIX=$HOME/.local install
    curl https://sh.rustup.rs -sSf | sh
    source ~/.bashrc
    cargo install exa
    apt install -y zsh git stow
    curl -sS https://webinstall.dev/zoxide | bash
    chsh -s $(which zsh)
    ;;
  * )
    echo "Unknown distribution!"
    ;;
esac



INSTALL_DIR=$HOME/.local
PATH=$PATH:$INSTALL_DIR/bin

# pushd . &> /dev/null
# TEMPDIR=$(mktemp -d)

###### INSTALL STOW ########
# if ! command -v stow &> /dev/null
# then
#   echo "Stow not found. Installing it now..."
#   cd $TEMPDIR

#   # Download and extract Stow source
#   echo "Downloading Stow source for installation..."
#   wget -q http://ftp.gnu.org/gnu/stow/stow-latest.tar.gz

#   echo "Extracting installation files..."
#   tar -xf stow-latest.tar.gz
#   rm -rf *.gz
#   cd stow*

#   # Install stow
#   echo "Installing Stow..."
#   ./configure --prefix=$INSTALL_DIR  &> /dev/null
#   make -j &> /dev/null
#   make install  &> /dev/null

#   rm -rf $TEMPDIR

#   echo "Stow installation complete."
# else
#   echo "Stow is already installed."
# fi

# Remove existing dotfiles
rm -rf $HOME/.gitconfig $HOME/.tmux.conf $HOME/.config/zsh $HOME/.zshrc

# popd &> /dev/null

# # Stow dotfiles to $HOME directory
# echo "Stowing dotfiles to $HOME directory."
# stow zsh git tmux

# pushd . &> /dev/null

# # Install ncurses, required to install Zsh
# if [ ! -f $INSTALL_DIR/lib/libncurses.a ]; then
#   echo "Installing ncurses library (dependency of zsh installation)."
#   cd $TEMPDIR
#   wget ftp://ftp.gnu.org/gnu/ncurses/ncurses-6.1.tar.gz --no-check-certificate
#   tar xf ncurses-6.1.tar.gz
#   cd ncurses-6.1
#   ./configure --prefix=$HOME/.local CXXFLAGS="-fPIC" CFLAGS="-fPIC"
#   make -j && make install &> /dev/null
# fi

# # Install Zsh
# if ! command -v zsh &> /dev/null
# then
#   echo "Installing Zsh..."
#   cd $TEMPDIR
#   wget https://www.zsh.org/pub/zsh-5.8.tar.xz --no-check-certificate
#   tar xf zsh-5.8.tar.xz
#   cd zsh-5.8
#   ./configure --prefix="$HOME/.local" \
#     CPPFLAGS="-I$HOME/.local/include" \
#     LDFLAGS="-L$HOME/.local/lib" &> /dev/null
#   make -j &> /dev/null
#   make install &> /dev/null
# fi

# # install zoxide
# if [ ! $(command -v "zoxide") ];
# then 
#   echo "Installing Zoxide..."
#   curl -sS https://webinstall.dev/zoxide | bash
# fi

# if ! command -v fzf &> /dev/null
# then
#   echo "Installing fzf..."
#   cd $TEMPDIR
#   wget https://github.com/junegunn/fzf/releases/download/0.28.0/fzf-0.28.0-linux_amd64.tar.gz
#   tar xf fzf-0.28.0-linux_amd64.tar.gz --directory $INSTALL_DIR/bin
# fi

# if ! command -v lazygit &> /dev/null
# then
#   echo "Installing lazygit..."
#   cd $TEMPDIR
#   wget https://github.com/jesseduffield/lazygit/releases/download/v0.31.4/lazygit_0.31.4_Linux_x86_64.tar.gz
#   tar xf lazygit_0.31.4_Linux_x86_64.tar.gz --directory $INSTALL_DIR/bin
# fi

# popd &> /dev/null
# rm -rf $TEMPDIR &> /dev/null

# if [ -f $HOME/.bash_profile ]; then
#     source $HOME/.bash_profile
# fi

# echo "Zsh installed! Restart shell or login again for changes to take effect."

echo ''
