PREFIX=$HOME/.local
TEMP_DIR=`mktemp -d`

mkdir -p $PREFIX/bin

echo "Cloning $(.dotfiles) repository."
git clone git@github.com:wespiard/.dotfiles.git $HOME/.dotfiles

pushd $TEMP_DIR

# INSTALL RUST
echo ""
echo "-------------------------------------------"
CARGO_DIR=$HOME/.cargo
if [ ! -d $CARGO_DIR ]; then
	echo "Installing Rust..."
	echo "-------------------------------------------"
	curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- --no-modify-path -y -q
	source "$CARGO_DIR/env"
	cargo install eza fd-find ripgrep bat du-dust
	echo "-------------------------------------------"
else
	echo "Rust is already installed."
	echo "-------------------------------------------"
fi
popd

# Install packages
echo ""
echo "-------------------------------------------"
echo "Installing fzf and lazygit..."
sudo pacman -S fzf lazygit stow --noconfirm
echo "-------------------------------------------"


pushd $HOME/.dotfiles
rm -rf $HOME/.gitconfig $HOME/.zshrc $HOME/.config/lazygit $HOME/.tmux.conf
stow git zsh tmux lazygit fish
popd
