--  _   _                          _
-- | \ | |   ___    ___   __   __ (_)  _ __ ___
-- |  \| |  / _ \  / _ \  \ \ / / | | | '_ ` _ \
-- | |\  | |  __/ | (_) |  \ V /  | | | | | | | |
-- |_| \_|  \___|  \___/    \_/   |_| |_| |_| |_|
--
-- Config v2.0
-- by: yeyee2901
-- main machine: Fedora 35 - i3 edition
-- 15 November 2021

vim.cmd [[set termguicolors]]
require 'basic-settings'
require 'packer-plugins-setup'
require 'keymap'
vim.cmd [[source ~/.config/nvim/autocmd.vim]]

-- PLUGIN SETTINGS
vim.cmd [[source ~/.config/nvim/lua/plugin-settings/tabline.vim]]
require 'plugin-settings.nvim-tree'
require 'cmp-lsp-treesitter'
require 'plugin-settings.formatter'
require 'plugin-settings.telescope'
require 'plugin-settings.markdown'

local transparent_line_number = true
require('plugin-settings.color').neo_solarized(transparent_line_number)
-- require('plugin-settings.color').solarized()

-- require('plugin-settings.indent-blankline')
