# Fedooo-Files
My minimalistic dotfiles for Fedora 35 - i3 edition

## NEW WINDOW MANAGER JOINS THE FRAY - BSPWM
Now this dotfiles repo can also be used for `bspwm` window manager!
Here's some screenshot of it:

![i3](https://user-images.githubusercontent.com/55247343/147756245-b2334adc-251a-49a0-b4af-b907a09a97e2.png)
![bspwm](https://user-images.githubusercontent.com/55247343/147756251-29fb388a-151d-46be-998a-82042cdb564e.png)

Although the setup are almost identical, but how `i3` works and how `bspwm` works are different (you can google it for more info). Some of you maybe wondering why would I create 2 identical config (also with identical looks), this is because I'm often confused on how `i3` handles multi-monitor setup (which is shared workspace behaviour), while in `bspwm` case, it would handle multi monitors as if each monitor have it's own set of workspaces, and they're not shared across monitors. I find these rather easier to handle (for my slow brain), so I tend to log in using `bspwm` when I'm on multi-monitor setup, and use `i3` whenever I'm not using multi-monitors setup. You can chose whichever, I won't force you to join either side, because 'Linux is FREEDOM', what you chose is what you get.

Also, **Kuchiki Rukia** = SIMP guehehehe. Cheers for Bleach comeback in 2022!

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
- **Window Manager**
   - Select between `bspwm` or `i3-wm` when logging in. The option button is on the upper right corner of `lightdm` login screen.
   - `bspwm` setup uses `sxhkd` for managing keyboard shortcuts, the config file is `~/.config/sxhkd/sxhkdrc`
   - `i3-wm` setup uses the keyboard shortcuts API (`bindsym`) provided in `i3` config file
   - Window rules, some type of windows are automatically sent to appropriate workspace. For example, if you spawn Firefox instance, it will be sent to workspace 2 automatically (the one that has Firefox icon in it). For `i3`, this is already an easy breeze, because you can match a window name using regex. But not for `bspwm`, as it cannot match a window name using regex.
- **rofi**
   - Program launcher ( Win + Enter ) OR press the fedora icon on the left of status bar
   - Powermenu ( Win + Ctrl + q ) OR press the power icon on the right status bar
- **picom** - Compositor, enables window transparency & polybar transparency
- **Alacritty & Kitty** - Graphic enchanced Terminal with JetBrains Mono Nerd Font ( Win + t )
   - Font JetBrains Mono Nerd Font in ~/.fonts/
   - default terminal: **Kitty**
- **Tmux** - For terminal session management
- **polybar** - Customizable status bar with icons (from JetBrainsMono Nerd Font)
- fresh install script with customizable install list

- EDITOR: **Neovim 0.6.0** :
  - **Packer** - Plugin manager
  - **Colorscheme** - Material.nvim (palenight variant)
  - **Nvim Tree** - File tree viewer
  - **LSP** - For IDE experience, using native LSP (bye coc.nvim)
  - **nvim-cmp** - Completion engine
  - **Fugitive & Gitsigns** - Git superpowers
  - **Ultisnips** - Snippet engine, integrated into `nvim-cmp` so it shows up in completion pop up.
  - **Treesitter** - for better syntax highlighting
  - **Telescope** - Extendable & customizable fuzzy finder
  - **Vim-commentary** - Commenting plugins, press `gcc` in NORMAL mode to comment a line, or after selecting lines of code you can comment it with `gc`
  - **Formatter.nvim** - Helper plugin for interacting with external code formatter such as `prettier`, `stylua`, etc. **TODO**: setup install script for formatters
