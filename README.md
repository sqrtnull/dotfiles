# dotfiles setup

```
git clone https://github.com/sqrtnull/dotfiles.git $HOME/.config
```
## Notes
- `.git/info/exclude` for a local `.gitignore`
- add `_rc` and `_profile` to respective files

## Installation

```
./setup.sh
```

**rust install**
```
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
. $HOME/.cargo/env

rustup component add rust-analyzer
```

**cargo-binstall install**
```
curl -L --proto '=https' --tlsv1.2 -sSf https://raw.githubusercontent.com/cargo-bins/cargo-binstall/main/install-from-binstall-release.sh | bash
```

**cargo install**
```
ripgrep
uv
stylua
typst-cli
mdbook
zellij
just
fd-find
```

**uv install**
```
curl -LsSf https://astral.sh/uv/install.sh | sh
```
```
cargo binstall --locked uv
```

**ruff install**
```
uv tool install ruff
```

**brew install**
```
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
```

**install tmux, lazygit, fzf**
```
brew install tmux lazygit fzf
```

**neovim install (linux)**
```
curl -LO https://github.com/neovim/neovim/releases/latest/download/nvim-linux-x86_64.appimage
chmod u+x nvim-linux-x86_64.appimage
mkdir -p $HOME/.local/bin
mv nvim-linux-x86_64.appimage $HOME/.local/bin/nvim
```
