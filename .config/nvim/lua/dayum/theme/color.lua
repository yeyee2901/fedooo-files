require('material').setup {

  contrast = false, -- Enable contrast for sidebars, floating windows and popup menus like Nvim-Tree
  borders = true, -- Enable borders between verticaly split windows

  popup_menu = 'colorful', -- Popup menu style ( can be: 'dark', 'light', 'colorful' or 'stealth' )

  italics = {
    comments = false, -- Enable italic comments
    keywords = false, -- Enable italic keywords
    functions = false, -- Enable italic functions
    strings = true, -- Enable italic strings
    variables = false, -- Enable italic variables
  },

  contrast_windows = { -- Specify which windows get the contrasted (darker) background
    'terminal', -- Darker terminal background
    'packer', -- Darker packer background
    'qf', -- Darker qf list background
  },

  text_contrast = {
    lighter = false, -- Enable higher contrast text for lighter style
    darker = true, -- Enable higher contrast text for darker style
  },

  disable = {
    background = true, -- Prevent the theme from setting the background (NeoVim then uses your teminal background)
    term_colors = false, -- Prevent the theme from setting terminal colors
    eob_lines = false, -- Hide the end-of-buffer lines
  },

  custom_highlights = {}, -- Overwrite highlights with your own
}

vim.g.material_style = 'palenight'

vim.cmd [[colorscheme material]]

vim.cmd [[autocmd BufEnter * highlight TelescopeNormal guibg=none]]
vim.cmd [[autocmd BufEnter * highlight Normal guibg=none]]
vim.cmd [[highlight NormalFloat guibg=none]]
vim.cmd [[autocmd BufEnter,VimEnter,FileType NvimTree highlight NvimTreeFolderIcon guibg=none]]
