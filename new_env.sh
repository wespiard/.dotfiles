PREFIX=$HOME/.local
TEMP_DIR=$HOME/tmp

mkdir -p $TEMP_DIR $PREFIX/bin

echo "Cloning `.dotfiles` repository."
git clone https://github.com/wespiard/.dotfiles.git $HOME/.dotfiles

clear

pushd $TEMP_DIR
# INSTALL CONDA
echo ""
echo "-------------------------------------------"
CONDA_DIR=$HOME/.miniconda
if [ ! -d $CONDA_DIR ];
then
    echo "Installing Miniconda..."
    echo "-------------------------------------------"
    curl -sLO https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh

    # -b flag runs installer in batch mode without user interaction
    bash Miniconda3-latest-Linux-x86_64.sh -b -p $CONDA_DIR
    rm -f Miniconda3-latest-Linux-x86_64.sh
    $CONDA_DIR/bin/conda init bash
    $CONDA_DIR/bin/conda config --set auto_activate_base false
    $CONDA_DIR/bin/conda config --add channels conda-forge
echo "-------------------------------------------"
else
    echo "Miniconda is already installed."
    echo "-------------------------------------------"
fi

# INSTALL RUST
echo ""
echo "-------------------------------------------"
CARGO_DIR=$HOME/.cargo
if [ ! -d $CARGO_DIR ];
then
    echo "Installing Rust..."
    echo "-------------------------------------------"
    curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- --no-modify-path -y -q
    source "$CARGO_DIR/env"
    cargo install exa fd-find ripgrep
echo "-------------------------------------------"
else
    echo "Rust is already installed."
echo "-------------------------------------------"
fi

# INSTALL FZF
echo ""
echo "-------------------------------------------"
if ! command -v fzf > /dev/null
then
    echo "Installing fzf..."
    echo "-------------------------------------------"
    wget https://github.com/junegunn/fzf/releases/download/0.38.0/fzf-0.38.0-linux_amd64.tar.gz
    tar xf fzf*
    mv fzf $HOME/.local/bin
    rm -rf fzf*
else
    echo "fzf is already installed."
fi
echo "-------------------------------------------"
popd

pushd $HOME/.dotfiles
stow git zsh tmux
popd

# echo "-------------------------------------------"
# echo ""
# echo "NOTE: LOGOUT OF YOUR SHELL AND LOG BACK IN"
# echo ""
# echo "-------------------------------------------"

