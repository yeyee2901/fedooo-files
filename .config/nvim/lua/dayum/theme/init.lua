local theme_res, theme_ok = pcall(require, 'material')
local lualine_res, lualine_ok = pcall(require, 'lualine')
local nvim_tree_res, nvim_tree_ok = pcall(require, 'nvim-tree')

if theme_ok and lualine_ok and nvim_tree_ok then
  require 'dayum.theme.lualine'
  require 'dayum.theme.nvim-tree'
  require 'dayum.theme.color'
end
