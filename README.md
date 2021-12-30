# Dotfiles Fedora
My minimalistic dotfiles for Fedora 35 - i3 edition

## NEW FEATURES
Now this dotfiles repo can also be used on `bspwm` window manager!
Here's some screenshot of it:


Although the setup are almost identical, but how `i3` works and how bspwm works is different. Some of you maybe wondering why would I create 2 identical config (also with identical looks), this is because I'm often confused on how `i3` handles multi-monitor setup (which is shared workspace behaviour), while in `bspwm` case, it would handle multi monitors as if each monitor have it's own set of workspaces, and they're not shared across monitors. I find these rather easier to handle (for my slow brain), so I tend to log in using `bspwm` when I'm on multi-monitor setup. You can chose whichever, I won't force you to join either side, because 'Linux is FREEDOM', what you chose is what you get.

Also, Kuchiki Rukia = SIMP guehehehe.

## Fresh install

1. Cloning the repository
```bash
alias dotfiles='/usr/bin/git --git-dir=$HOME/dotfiles/ --work-tree=$HOME'

# to avoid recursiveness
echo "dotfiles" > ~/.gitignore

git clone --bare https://github.com/yeyee2901/dotfiles-fedora-i3.git $HOME/dotfiles
dotfiles checkout

source ~/.alias_envs

dotfiles config --local status.showUntrackedFiles no
```
2. After cloning, restart your terminal so the paths are registered correctly. And then you can run the `fresh-install.sh` script
```bash
chmod +x $HOME/.scripts/lsp-install.sh
chmod +x $HOME/.scripts/fresh-install.sh

$HOME/.scripts/fresh-install.sh
```
3. Also, make sure to check the install scripts in case you want to add something else.

## Features
- **i3** -  window manager
- **rofi** - Program launcher ( Win + Enter )
- **Alacritty & Kitty** - Graphics enchanced Terminal with JetBrains Mono Nerd Font ( Win + t )
   - Font JetBrains Mono Nerd Font in ~/.fonts/
   - default: **Kitty**
- **Tmux** - For terminal session management
- **polybar** - Customizable status bar
- fresh install script with customizable install list

- EDITOR: **Neovim 0.5.1** :
  - **Packer** - Plugin manager
  - **Color** - Solarized & NeoSolarized (default: neo)
  - **Nvim Tree** - File tree viewer
  - **nvim CMP** - Completion engine
  - **Ultisnips** - Snippet engine
  - **LSP** - For IDE experience, using native LSP (bye coc.nvim)
  - **Treesitter** - for better syntax highlighting
  - **Telescope** - Extendable & customizable fuzzy finder
  - **Distant** - Remote development
