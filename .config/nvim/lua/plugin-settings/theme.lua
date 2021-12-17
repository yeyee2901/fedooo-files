-- Lualine
local lualine = require 'plugin-settings.lualine'

local my_theme = function()
  local opts = {
    solarized_termtrans = 1,
    solarized_italics = 1,
    solarized_visibility = 'normal',
    solarized_diffmode = 'normal',
  }

  for option, value in ipairs(opts) do
    vim.g[opts] = value
  end

  lualine.setup_lualine 'solarized_dark'
  vim.cmd 'colorscheme solarized-high'

  -- custom color
  vim.cmd 'highlight Normal guibg=none'
  vim.cmd 'highlight CursorLine guibg=#232345'
  vim.cmd 'highlight LineNr guibg=none'
  vim.cmd 'highlight TSConstructor guifg=#dc322f'
  vim.cmd 'highlight Delimiter guifg=#dc322f'
end

my_theme()
