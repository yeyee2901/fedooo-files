require('basic-settings')
require('packer-plugins-setup')

-- PLUGIN SETTINGS
vim.cmd[[source ~/.config/nvim/lua/plugin-settings/tabline.vim]]
require('plugin-settings.color').solarized()
