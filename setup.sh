#!/bin/bash

# rust
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
. $HOME/.cargo/env

rustup component add rust-analyzer

# cargo binstall
curl -L --proto '=https' --tlsv1.2 -sSf https://raw.githubusercontent.com/cargo-bins/cargo-binstall/main/install-from-binstall-release.sh | bash

# ripgrep uv typst-cli
cargo binstall --locked ripgrep uv typst-cli

# run in ~/.local/bin
mkdir -p $HOME/.local/bin
cd $HOME/.local/bin

# get OS and arch
OS=$(uname -s | tr '[:upper:]' '[:lower:]')
ARCH=$(uname -m)
if [ "$ARCH" = "x86_64" ]; then
    ARCH="x86_64"
elif [ "$ARCH" = "aarch64" ] || [ "$ARCH" = "arm64" ]; then
    ARCH="arm64"
fi

# lazygit
VERSION=$(curl -s "https://api.github.com/repos/jesseduffield/lazygit/releases/latest" | rg -Po '"tag_name": "v\K[^"]*')

curl -Lo lazygit.tar.gz "https://github.com/jesseduffield/lazygit/releases/latest/download/lazygit_${VERSION}_${OS}_${ARCH}.tar.gz"

tar -xzf lazygit.tar.gz lazygit

chmod +x lazygit
rm lazygit.tar.gz

# neovim
NVIMOS=$OS
if [ "$NVIMOS" = "darwin" ]; then
    NVIMOS="macos"
fi

curl -Lo nvim.tar.gz https://github.com/neovim/neovim/releases/latest/download/nvim-${NVIMOS}-${ARCH}.tar.gz
if [ "$NVIMOS" = "macos" ]; then
    xattr -c ./nvim.tar.gz
fi
tar -xzf nvim.tar.gz
ln -s $HOME/.local/bin/nvim-${NVIMOS}-${ARCH}/bin/nvim $HOME/.local/bin/nvim
rm nvim.tar.gz

# fzf
git clone --depth 1 https://github.com/junegunn/fzf.git $HOME/.fzf
$HOME/.fzf/install
