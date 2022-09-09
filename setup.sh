#!/bin/sh

PREFIX=$HOME/.local
TEMP_DIR=$HOME/tmp

export PATH=$PREFIX/bin:$PATH
export LD_LIBRARY_PATH=$PREFIX/lib64:$PREFIX/lib:$LD_LIBRARY_PATH
export LIBRARY_PATH=$PREFIX/lib64:$PREFIX/lib:$LIBRARY_PATH
export PKG_CONFIG_PATH=$PREFIX/lib/pkgconfig
export C_INCLUDE_PATH=$PREFIX/include

mkdir -p $TEMP_DIR $PREFIX/bin

pushd $TEMP_DIR > /dev/null

clear
echo ""
echo "-------------------------------------------"


CONDA_DIR=$HOME/.miniconda

if [ ! -d $CONDA_DIR ];
then
    echo "Installing Miniconda..."
    curl -sLO https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh

    # -b flag runs installer in batch mode without user interaction
    bash Miniconda3-latest-Linux-x86_64.sh -b -p $CONDA_DIR > /dev/null
    rm -f Miniconda3-latest-Linux-x86_64.sh

    # init adds to your shell config file, adding conda"s dir to env variables
    $CONDA_DIR/bin/conda init bash$PREFIX/lib:
    source $HOME/.bashrc

    conda config --set auto_activate_base false
    conda config --add channels conda-forge 
    conda create -qy -n $USER python=3.9 c-compiler cxx-compiler cmake
else
    echo "Miniconda is already installed."
fi

conda activate $USER
conda --version 
echo "-------------------------------------------"

# clear
echo ""
echo "-------------------------------------------"
if ! command -v ninja > /dev/null
then
    echo "Installing Ninja..."
    curl -sLO https://github.com/ninja-build/ninja/releases/download/v1.11.1/ninja-linux.zip
    unzip ninja-linux.zip > /dev/null
    mv ninja $PREFIX/bin/ninja

    rm -rf ninja*
else
    echo "Ninja is already installed."
fi

echo "ninja version: $(ninja --version)"
echo "-------------------------------------------"


# clear
echo ""
echo "-------------------------------------------"
if [ ! -f $PREFIX/include/zlib.h ];
then
    echo "Installing zlib..."
    curl -sLO https://www.zlib.net/zlib-1.2.12.tar.gz
    tar xf zlib-1.2.12.tar.gz
    pushd zlib-1.2.12 > /dev/null
    ./configure --prefix=$PREFIX > /dev/null
    make -j > /dev/null
    make install > /dev/null
    popd > /dev/null
    rm -rf zlib*
else
    echo "zlib is already installed."
fi
echo "-------------------------------------------"


# clear
echo ""
echo "-------------------------------------------"
if ! command -v stow > /dev/null
then
    echo "Installing stow..."
    curl -sLO https://ftp.gnu.org/gnu/stow/stow-2.3.1.tar.gz
    tar xf stow-2.3.1.tar.gz
    pushd stow-2.3.1 > /dev/null
    ./configure --prefix=$PREFIX > /dev/null
    make -j > /dev/null
    make install > /dev/null
    popd > /dev/null
    rm -rf stow*
else
    echo "stow is already installed."
fi
stow --version
echo "-------------------------------------------"



# clear
echo ""
echo "-------------------------------------------"
if ! command -v ninja > /dev/null
then
    echo "Installing Ninja..."
    curl -sLO https://github.com/ogham/exa/releases/download/v0.10.1/exa-linux-x86_64-v0.10.1.zip
    unzip exa-linux-x86_64-v0.10.1.zip > /dev/null
    mv ninja $PREFIX/bin/ninja

    rm -rf ninja*
else
    echo "Ninja is already installed."
fi

echo "ninja version: $(ninja --version)"
echo "-------------------------------------------"

# clear
echo ""
echo "-------------------------------------------"
if ! cmake --version | grep 3.24 > /dev/null
then
    echo "Installing CMake..."
    conda install -qy cmake 
    curl -sLO https://github.com/Kitware/CMake/releases/download/v3.24.1/cmake-3.24.1.tar.gz
    tar xf cmake-3.24.1.tar.gz
    pushd cmake-3.24.1 > /dev/null

    cmake . -DCMAKE_INSTALL_PREFIX=$PREFIX -DCMAKE_USE_OPENSSL=ON > /dev/null
    make -j > /dev/null
    make install > /dev/null

    popd > /dev/null
    rm -rf cmake*
    conda remove -qy cmake
else
    echo "CMake is already installed."
fi

cmake --version | head -n 1
echo "-------------------------------------------"

# clear
# echo ""
# echo "-------------------------------------------"
# if [ ! -d $PREFIX/openssl ];
# then
#     echo "Installing OpenSSL..."
#     curl -sLO https://www.openssl.org/source/openssl-1.1.1q.tar.gz
#     tar xf openssl-1.1.1q.tar.gz
#     pushd openssl-1.1.1q > /dev/null
#     ./Configure --prefix=$PREFIX --openssldir=$PREFIX/openssl shared linux-x86_64 > /dev/null
#     make -j > /dev/null
#     make install > /dev/null
#     popd > /dev/null
#     rm -rf openssl*
# else
#     echo "OpenSSL is already installed."
# fi

# openssl version
# echo "-------------------------------------------"

# clear
echo ""
echo "-------------------------------------------"
if ! curl -V | grep 7.85 > /dev/null
then
    echo "Installing curl..."
    curl -sLO https://curl.se/download/curl-7.85.0.tar.gz
    tar xf curl-7.85.0.tar.gz
    pushd curl-7.85.0 > /dev/null
    ./configure --prefix=$PREFIX --with-openssl > /dev/null
    make -j > /dev/null
    make install > /dev/null
    popd > /dev/null
    rm -rf curl*
else
    echo "curl is already installed."
fi

curl -V | head -n 1
echo "-------------------------------------------"


# clear
echo ""
echo "-------------------------------------------"
if ! git --version | grep 2.37 > /dev/null
then
    # conda install -qy zlib
    echo "Installing git..."
    curl -sLO https://mirrors.edge.kernel.org/pub/software/scm/git/git-2.37.3.tar.gz
    tar xf git-2.37.3.tar.gz
    pushd git-2.37.3 > /dev/null
    ./configure --prefix=$PREFIX > /dev/null
    make -j > /dev/null
    make install > /dev/null
    popd > /dev/null
    rm -rf git*
    # conda remove -qy zlib
else
    echo "git is already installed."
fi

git --version
echo "-------------------------------------------"


# clear
echo ""
echo "-------------------------------------------"
if ! command -v nvim > /dev/null
then
    echo "Installing Neovim..."
    curl -sLO https://github.com/neovim/neovim/archive/refs/tags/v0.7.2.tar.gz
    tar xf v0.7.2.tar.gz
    pushd neovim-0.7.2 > /dev/null
    make CMAKE_BUILD_TYPE=Release CMAKE_INSTALL_PREFIX=$PREFIX > /dev/null
    make install > /dev/null
    popd > /dev/null
    rm -rf neovim*
else
    echo "Neovim is already installed."
fi

nvim --version | head -n 1
echo "-------------------------------------------"



# clear
echo ""
echo "-------------------------------------------"
if ! command -v zsh > /dev/null
then
    echo "Installing zsh..."
    curl -sLO https://www.zsh.org/pub/zsh-5.9.tar.xz
    tar xf zsh-5.9.tar.xz
    pushd zsh-5.9 > /dev/null
    ./configure --prefix=$PREFIX > /dev/null
    make -j > /dev/null
    make install > /dev/null
    popd > /dev/null
    rm -rf zsh*
else
    echo "zsh is already installed."
fi

zsh --version
echo "-------------------------------------------"

popd > /dev/null
rm -rf $TEMP_DIR

conda deactivate

echo ""

# TODO: REMIND USER TO ADD EXPORTS TO BASHRC
