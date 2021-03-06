#!/bin/bash

# Language Servers from NPM registry
npm i -g \
    bash-language-server \
    intelephense \
    pyright \
    typescript \
    typescript-language-server \
    prettier \
    vim-language-server \
    vscode-langservers-extracted \
    clang-format

# Sadly, on fedora, ccls is not available on the registry
# we have to take a roundabout path to SNAP :)
# Disable this if you don't want to use snap
# sudo dnf install snap
# sudo ln -s /var/lib/snapd /usr/bin/snap
# sudo snap install ccls
