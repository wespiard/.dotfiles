#!/bin/bash

INSTALL_DIR=$HOME/.local
PATH=$PATH:$INSTALL_DIR/bin

pushd . &> /dev/null
TEMPDIR=$(mktemp -d)

if ! command -v stow &> /dev/null
then
  echo "Stow not found. Installing it now..."
  cd $TEMPDIR

  # Download and extract Stow source
  wget http://ftp.gnu.org/gnu/stow/stow-latest.tar.gz
  tar -xf stow-latest.tar.gz && cd stow*

  # Install stow
  ./configure --prefix=$INSTALL_DIR
  make -j && make install
else
  echo "Stow is already installed."
fi

# Remove existing dotfiles
rm -rf $HOME/.gitconfig $HOME/.tmux.conf $HOME/.config/zsh $HOME/.zshrc &> /dev/null

popd &> /dev/null

# Stow dotfiles to $HOME directory
echo "Stowing dotfiles to $HOME directory."
stow zsh git tmux

pushd . &> /dev/null

# Install ncurses, required to install Zsh
if [ ! -f $INSTALL_DIR/lib/libncurses.a ]; then
  echo "Installing ncurses library (dependency of zsh installation)."
  cd $TEMPDIR
  wget ftp://ftp.gnu.org/gnu/ncurses/ncurses-6.1.tar.gz --no-check-certificate
  tar xf ncurses-6.1.tar.gz
  cd ncurses-6.1
  ./configure --prefix=$HOME/.local CXXFLAGS="-fPIC" CFLAGS="-fPIC"
  make -j && make install &> /dev/null
fi

# Install Zsh
if ! command -v zsh &> /dev/null
then
  echo "Installing Zsh..."
  cd $TEMPDIR
  wget https://www.zsh.org/pub/zsh-5.8.tar.xz --no-check-certificate
  tar xf zsh-5.8.tar.xz
  cd zsh-5.8
  ./configure --prefix="$HOME/.local" \
    CPPFLAGS="-I$HOME/.local/include" \
    LDFLAGS="-L$HOME/.local/lib" &> /dev/null
  make -j &> /dev/null
  make install &> /dev/null
fi

if ! command -v fzf &> /dev/null
then
  echo "Installing fzf..."
  cd $TEMPDIR
  wget https://github.com/junegunn/fzf/releases/download/0.28.0/fzf-0.28.0-linux_amd64.tar.gz
  tar xf fzf-0.28.0-linux_amd64.tar.gz --directory $INSTALL_DIR/bin
fi

popd &> /dev/null
rm -rf $TEMPDIR &> /dev/null

if [ -f $HOME/.bash_profile ]; then
    source $HOME/.bash_profile
fi

# echo "Zsh installed! Restart shell or login again for changes to take effect."