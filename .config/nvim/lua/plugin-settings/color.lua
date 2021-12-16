local M = {}

-- Lualine
local lualine = require 'plugin-settings.lualine'

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

  -- cursorline color
  vim.cmd 'highlight CursorLine guibg=#232345'

  if transparent_line_number then
    vim.cmd 'highlight LineNr guibg=none'
    -- vim.cmd 'highlight TabLine gui=none guibg=none'
    -- vim.cmd 'highlight TabLineSel gui=none guibg=none guifg=#dc322f'
  else
    vim.cmd 'highlight TabLine gui=none guibg=#073642'
    -- vim.cmd 'highlight TabLineFill gui=none guibg=#073642'
    -- vim.cmd 'highlight TabLineSel gui=none guibg=#073642 guifg=#dc322f'
  end

  vim.cmd 'highlight! link SignColumn LineNr'
end

-- Vim colorizer
require('colorizer').setup()

return M
