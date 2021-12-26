-- 16color  (blue,green,black dominant)
-- ayu_dark, ayu_light, ayu_mirage
-- dracula
-- everforest (green)
-- gruvbox, gruvbox_light, gruvbox_material (sort of cream pink-ish?)
-- horizon (dark blue-pink dominant)
-- iceberg_dark, iceberg_light (very dark purple - very light blue)
-- jellybeans (like seoul256, but darker)
-- material (similar to jellybeans)
-- modus_vivendi (similar to jellybeans)
-- molokai (sublime color but brighter)
-- nightfly (match with tokyonight)
-- nord (like nightfly, but brighter)
-- oceanicnext (light blue)
-- onedark, onelight (atom)
-- palenight
-- papercolor, papecolor_light, papercolor_dark (light theme)
-- powerline (like powerline shell, very bright)
-- seoul256 (match with gruvbuddy / gruvbox)
-- solarized, solarized_light, solarized_dark (match with solarized terminal theme)
-- tokyonight (match with tokyonight.nvim)
-- tomorrow
-- wombat (like seoul256, but lighter)

require('lualine').setup {
  options = {
    icons_enabled = true,
    theme = 'nightfly',
    component_separators = { left = '', right = '' },
    section_separators = { left = '', right = '' },
    disabled_filetypes = {},
    always_divide_middle = true,
  },
  sections = {
    lualine_a = { 'mode' },
    lualine_b = { 'filetype', 'filename' },
    lualine_c = {
      -- diagnostic
    },
    lualine_x = {},
    lualine_y = {},
    lualine_z = { 'location', 'branch' },
  },
  inactive_sections = {
    lualine_a = {},
    lualine_b = {},
    lualine_c = { 'filename' },
    lualine_x = { 'location' },
    lualine_y = {},
    lualine_z = {},
  },
  tabline = {},
  extensions = {},
}
