local map = vim.api.nvim_set_keymap
local opts = {
  noremap = true,
}

local silent = {
  noremap = true,
  silent = true,
}

-- SET LEADER
map('', '<Space>', '<Nop>', opts)
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- SOURCE
map('n', '<Leader><S-r>', ':w<CR><cmd>luafile %<CR>', silent)
map('n', '<Leader><S-s>', ':w<CR><cmd>luafile %<CR><cmd>PackerSync<CR>', silent)

-- WINDOW KEYMAPS
map('n', '<C-h>', '<C-w>h', opts)
map('n', '<C-l>', '<C-w>l', opts)
map('n', '<C-j>', '<C-w>j', opts)
map('n', '<C-k>', '<C-w>k', opts)
map('n', 'sh', '<C-w>s', opts)
map('n', 'sv', '<C-w>v', opts)
map('n', 'sq', '<C-w>q', opts)
map('n', '<M-k>', '<C-w>+', opts)
map('n', '<M-j>', '<C-w>-', opts)
map('n', '<M-l>', '<C-w>>', opts)
map('n', '<M-h>', '<C-w><', opts)

-- PLUGIN: barbar
map('n', '<Tab>l', '<cmd>BufferNext<CR>', opts)
map('n', '<Tab>h', '<cmd>BufferPrevious<CR>', opts)
map('n', '<Tab>1', '<cmd>BufferGoto 1<CR>', opts)
map('n', '<Tab>2', '<cmd>BufferGoto 2<CR>', opts)
map('n', '<Tab>3', '<cmd>BufferGoto 3<CR>', opts)
map('n', '<Tab>4', '<cmd>BufferGoto 4<CR>', opts)
map('n', '<Tab>5', '<cmd>BufferGoto 5<CR>', opts)
map('n', '<Tab>6', '<cmd>BufferGoto 6<CR>', opts)
map('n', '<Tab>7', '<cmd>BufferGoto 7<CR>', opts)
map('n', '<Tab>8', '<cmd>BufferGoto 8<CR>', opts)
map('n', '<Tab>9', '<cmd>BufferGoto 9<CR>', opts)
map('n', '<Tab>0', '<cmd>BufferLast<CR>', opts)
map('n', '<Tab>g', '<cmd>BufferPick<CR>', opts)

map('n', '<Tab>H', '<cmd>BufferMovePrevious<CR>', opts)
map('n', '<Tab>L', '<cmd>BufferMoveNext<CR>', opts)

map('n', '<Tab>q', '<cmd>BufferClose<CR>', opts)

-- PLUGIN: Nvim-tree
map('n', '<Leader>n', '<cmd>NvimTreeToggle<CR>', opts)

-- PLUGIN: lsp stuffs
map('n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>', opts)
map('n', '<Leader>K', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
map('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', opts)
map('n', '<Leader>lr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
map('n', '<Leader>j', '<cmd>lua vim.diagnostic.goto_next()<CR>', opts)
map('n', '<Leader>k', '<cmd>lua vim.diagnostic.goto_prev()<CR>', opts)

-- PLUGIN: Telescope
map('n', '<Leader>t?', '<cmd>Telescope help<CR>', opts)
map('n', '<Leader>tc', '<cmd>Telescope commands<CR>', opts)
map('n', '<Leader>tf', '<cmd>Telescope find_files<CR>', opts)
map('n', '<Leader>tb', '<cmd>Telescope buffers<CR>', opts)
map('n', '<Leader>tz', '<cmd>Telescope current_buffer_fuzzy_find<CR>', opts)

map('n', '<Leader>ts', '<cmd>Telescope live_grep<CR>', opts)

-- Query all function names, vars, and ohter symbols from Tree Sitter queries
map('n', '<Leader>tt', '<cmd>Telescope treesitter<CR>', opts)

-- LSP in Telescope
map('n', '<Leader>tlds', '<cmd>Telescope lsp_document_symbols<CR>', opts)
map('n', '<Leader>tlws', '<cmd>Telescope lsp_workspace_symbols<CR>', opts)
map('n', '<Leader>tlwd', '<cmd>Telescope lsp_workspace_diagnostics<CR>', opts)

map('n', '<Leader>tla', '<cmd>Telescope lsp_range_code_actions<CR>', opts)
map('n', '<Leader>tlgd', '<cmd>Telescope lsp_definitions<CR>', opts)
map('n', '<Leader>tlr', '<cmd>Telescope lsp_references<CR>', opts)
map('n', '<Leader>tqf', '<cmd>Telescope quickfix<CR>', opts)

-- Git in Telescope
map('n', '<Leader>tgb', '<cmd>Telescope git_branches<CR>', opts)
map('n', '<Leader>tgs', '<cmd>Telescope git_status<CR>', opts)
map('n', '<Leader>tgf', '<cmd>Telescope git_files<CR>', opts)
map('n', '<Leader>tgca', '<cmd>Telescope git_commits<CR>', opts)
map('n', '<Leader>tgcb', '<cmd>Telescope git_bcommits<CR>', opts)

-- Telescope extensions
map('n', '<Leader>tu', '<cmd>Telescope ultisnips<CR>', opts)

-- PLUGIN: Formatter
map('n', '<Leader>ff', '<cmd>Format<CR>', opts)

-- PLUGIN: VimWiki
map('n', '<Leader>wj', '<cmd>VimwikiNextLink<CR>', opts)
map('n', '<Leader>wk', '<cmd>VimwikiPrevLink<CR>', opts)
map('n', '<Leader>wtl', '<cmd>VimwikiToggleListItem<CR>', opts)
map('n', '<Leader>wtbc', '<cmd>VimwikiTable<CR>', opts)
map('n', '<Leader>wtbl', '<cmd>VimwikiTableMoveColumnRight<CR>', opts)
map('n', '<Leader>wtbh', '<cmd>VimwikiTableMoveColumnLeft<CR>', opts)
map('n', '<Leader>wa', '<cmd>VimwikiAll2HTML<CR>', opts)
map('n', '<CR><CR>', '<cmd>VimwikiFollowLink<CR>', opts)
map('n', '<CR>s', '<cmd>VimwikiSplitLink<CR>', opts)
map('n', '<CR>v', '<cmd>VimwikiVSplitLink<CR>', opts)
