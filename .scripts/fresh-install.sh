#!/usr/bin/bash

# For Tmux plugin manager
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

# Install the software lists
/usr/bin/cat $HOME/.scripts/install-list.txt | xargs -n1 -I {} sudo dnf install -y {}

# Install Oh-my-zsh
curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh -o $HOME/ohmyzsh-install.sh
chmod +x $HOME/ohmyzsh-install.sh

# Install node packages
chmod +x $HOME/.scripts/lsp-install.sh
$HOME/.scripts/node-install.sh

# install pip packages
/usr/bin/ls $HOME/.scripts/pip-list.txt | xargs -n1 -I {} pip3 install {}

# Apply italics patch for tmux
tic $HOME/.screen-256color.terminfo

# Install ccls via snap :( , sadly it's only available on snap for fedora
sudo dnf install snap && sudo ln -s /var/lib/snapd/snap /snap && sudo snap install ccls

# Install rust things
# Rust toolchain
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
cargo install exa bat
cargo install stylua
