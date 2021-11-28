local M = {}

-- Dashboard
require 'plugin-settings.startify'

-- Lualine
local lualine = require 'plugin-settings.lualine'

M.solarized = function()
  local opts = {
    termguicolors = true,
    solarized_italics = true,
    solarized_visibility = 'high',
    solarized_diffmode = 'high',
    solarized_termtrans = 0,
  }

  for opt, val in ipairs(opts) do
    vim.g[opt] = val
  end

  lualine.setup_lualine 'solarized'
  vim.cmd 'colorscheme solarized-high'

  vim.cmd 'highlight Normal guibg=none'
  vim.cmd 'highlight LineNr guibg=none'

  -- Fix tabline highlighting
  vim.cmd 'highlight TabLine gui=none guibg=none'
  vim.cmd 'highlight TabLineFill gui=none guibg=none'
  vim.cmd 'highlight TabLineSel gui=none guibg=none guifg=#dc322f'
  -- vim.cmd("highlight TSFunction guibg=none")
  -- vim.cmd("highlight TSVariable guibg=none")
end

-- For alternative
M.neo_solarized = function(transparent_line_number)
  local opts = {
    neosolarized_bold = 0,
    neosolarized_underline = 0,
    neosolarized_italic = 0,
    neosolarized_vertSplitBgTrans = 1,
    neosolarized_visibility = 'high',
    neosolarized_termBoldAsBright = 1,
  }

  for option, value in ipairs(opts) do
    vim.g[option] = value
  end

  vim.opt.background = 'dark'

  lualine.setup_lualine 'solarized_dark'
  vim.cmd 'colorscheme NeoSolarized'

  -- so my eyes don't hurt!
  -- The symbol color
  vim.cmd 'highlight CmpItemKindDefault guifg=#839496 guibg=#dc322f'
  vim.cmd 'highlight CmpItemMenuDefault guifg=#839496 guibg=#cb4b16'

  vim.cmd 'highlight Normal guibg=none'

  if transparent_line_number then
    vim.cmd 'highlight LineNr guibg=none'
    vim.cmd 'highlight TabLine gui=none guibg=none'
    vim.cmd 'highlight TabLineSel gui=none guibg=none guifg=#dc322f'
  else
    vim.cmd 'highlight TabLine gui=none guibg=#073642'
    vim.cmd 'highlight TabLineFill gui=none guibg=#073642'
    vim.cmd 'highlight TabLineSel gui=none guibg=#073642 guifg=#dc322f'
  end

  vim.cmd 'highlight! link SignColumn LineNr'

  -- Fix tabline highlighting
end

-- Vim colorizer
require('colorizer').setup()

return M
