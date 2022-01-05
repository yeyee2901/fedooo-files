local gs_ok, _ = pcall(require, 'gitsigns')

if gs_ok then
  require('gitsigns').setup {
    signs = {
      add = { hl = 'GitSignsAdd', text = '+', numhl = 'GitSignsAddNr', linehl = 'GitSignsAddLn' },
      change = { hl = 'GitSignsChange', text = '~', numhl = 'GitSignsChangeNr', linehl = 'GitSignsChangeLn' },
      delete = { hl = 'GitSignsDelete', text = '-', numhl = 'GitSignsDeleteNr', linehl = 'GitSignsDeleteLn' },
    },
    signcolumn = false, -- Toggle with `:Gitsigns toggle_signs`
    numhl = true, -- Toggle with `:Gitsigns toggle_numhl`
    linehl = false, -- Toggle with `:Gitsigns toggle_linehl`
    word_diff = false, -- Toggle with `:Gitsigns toggle_word_diff`

    keymaps = {
      noremap = true,

      -- toggle between sign mode / num hl mode
      ['n <leader>st'] = '<cmd>Gitsigns toggle_signs<CR><cmd>Gitsigns toggle_numhl<CR>',

      ['n ]c'] = { expr = true, "&diff ? ']c' : '<cmd>Gitsigns next_hunk<CR>'" },
      ['n [c'] = { expr = true, "&diff ? '[c' : '<cmd>Gitsigns prev_hunk<CR>'" },

      ['n <leader>ss'] = '<cmd>Gitsigns stage_hunk<CR>',
      ['v <leader>ss'] = ':Gitsigns stage_hunk<CR>',
      ['n <leader>su'] = '<cmd>Gitsigns undo_stage_hunk<CR>',
      ['n <leader>sr'] = '<cmd>Gitsigns reset_hunk<CR>',
      ['v <leader>sr'] = ':Gitsigns reset_hunk<CR>',
      ['n <leader>sR'] = '<cmd>Gitsigns reset_buffer<CR>',
      ['n <leader>sp'] = '<cmd>Gitsigns preview_hunk<CR>',
      ['n <leader>sb'] = '<cmd>lua require"gitsigns".blame_line{full=true}<CR>',
      ['n <leader>sS'] = '<cmd>Gitsigns stage_buffer<CR>',
      ['n <leader>sU'] = '<cmd>Gitsigns reset_buffer_index<CR>',
    },
    watch_gitdir = {
      interval = 1000, -- ms
      follow_files = true,
    },
    attach_to_untracked = true,
    current_line_blame = false, -- Toggle with `:Gitsigns toggle_current_line_blame`
    current_line_blame_opts = {
      virt_text = true,
      virt_text_pos = 'eol', -- 'eol' | 'overlay' | 'right_align'
      delay = 1000,
      ignore_whitespace = false,
    },
    current_line_blame_formatter_opts = {
      relative_time = false,
    },
    sign_priority = 6,
    update_debounce = 100,
    status_formatter = nil, -- Use default
    max_file_length = 40000,
    preview_config = {
      -- Options passed to nvim_open_win
      border = 'single',
      style = 'minimal',
      relative = 'cursor',
      row = 0,
      col = 1,
    },
    yadm = {
      enable = false,
    },
  }
end
