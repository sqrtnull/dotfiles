# dotfiles setup

```
git clone https://github.com/sqrtnull/dotfiles.git $HOME/.config
```
## Notes
- `.git/info/exclude` for a local `.gitignore`
- add `_rc` and `_profile` to respective files

## Installation

**Necessary packages**
```
neovim
tmux
lazygit

fzf # for sessionizer
ripgrep # for telescope
```

**rust install**
```
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
. $HOME/.cargo/env

rustup component add rust-analyzer
```
**neovim install**
```
curl -LO https://github.com/neovim/neovim/releases/latest/download/nvim-linux-x86_64.appimage
chmod u+x nvim-linux-x86_64.appimage
./nvim-linux-x86_64.appimage
mkdir -p $HOME/.local/bin
mv nvim-linux-x86_64.appimage $HOME/.local/bin/nvim
```

