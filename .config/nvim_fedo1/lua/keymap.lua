-- Wrapper function for remaps
local _noremap = function(mode, key, map_to)
  vim.api.nvim_set_keymap(mode, key, map_to, { noremap = true, silent = false })
end

local _noremap_silent = function(mode, key, map_to)
  vim.api.nvim_set_keymap(mode, key, map_to, { noremap = true, silent = true })
end

-- Map <leader> key to SPACE
_noremap('', '<Space>', '<Nop>')
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- Togle highlighting after searching
_noremap('n', '<S-h>', '<cmd>set hlsearch!<CR>')

-- Make <S-y> behaves the same as <S-d> , <S-C>
_noremap('n', '<S-y>', 'y$')

-- Search and replace
_noremap('n', 'S', ':%s/')

-- Visual mode editing ----------------------------------------------------------
_noremap('v', '<Tab>', '>gv')
_noremap('v', '<S-Tab>', '<gv')
_noremap('v', '<BS>', 'xgv')

-- useful for moving lines up and down with auto indenting
_noremap_silent('v', '<M-k>', ':m-2<CR>gv=gv')
_noremap_silent('v', '<M-j>', ":m '>+1<CR>gv=gv")

-- append to all selected line
-- (intended to be used with VISUAL-BLOCK mode only)
_noremap('v', 'aa', '$<S-a>')

-- Window Keymappings ------------------------------------------------------------
_noremap('n', '<C-l>', '<C-w>l')
_noremap('n', '<C-h>', '<C-w>h')
_noremap('n', '<C-j>', '<C-w>j')
_noremap('n', '<C-k>', '<C-w>k')

-- Rotate / move window around
_noremap('n', '<S-r>', '<C-w>r')

-- Resize window
-- Up, right    = increase
-- down, left   = decrease
_noremap('n', '<M-k>', '<C-w>+')
_noremap('n', '<M-j>', '<C-w>-')
_noremap('n', '<M-l>', '<C-w>>')
_noremap('n', '<M-h>', '<C-w><')

-- Create splits
_noremap('n', 'sv', '<C-w>v')
_noremap('n', 'sh', '<C-w>s')
_noremap('n', 'sq', '<C-w>q')

-- Tab keymappings ---------------------------------------------------------------
-- Enable this? then source tabline.vim
-- _noremap('n', '<Tab>n', '<cmd>tabnew<CR>')
-- _noremap('n', '<Tab>q', '<cmd>tabclose<CR>')
-- _noremap('n', '<Tab>l', '<cmd>tabnext<CR>')
-- _noremap('n', '<Tab>h', '<cmd>tabprevious<CR>')

-- Quickfix list -----------------------------------------------------------------
_noremap('n', '<C-Space><C-j>', '<cmd>cnext<CR>')
_noremap('n', '<C-Space><C-k>', '<cmd>cprevious<CR>')
_noremap('n', '<C-Space><C-o>', '<cmd>copen<CR>')
_noremap('n', '<C-Space><C-q>', '<cmd>cclose<CR>')

-- Plugin specific keymaps -------------------------------------------------------

-- PLUGIN: barbar.nvim (tabline plugin)
_noremap('n', '<Tab>l', '<cmd>BufferNext<CR>')
_noremap('n', '<Tab>h', '<cmd>BufferPrevious<CR>')
_noremap('n', '<Tab>1', '<cmd>BufferGoto 1<CR>')
_noremap('n', '<Tab>2', '<cmd>BufferGoto 2<CR>')
_noremap('n', '<Tab>3', '<cmd>BufferGoto 3<CR>')
_noremap('n', '<Tab>4', '<cmd>BufferGoto 4<CR>')
_noremap('n', '<Tab>5', '<cmd>BufferGoto 5<CR>')
_noremap('n', '<Tab>6', '<cmd>BufferGoto 6<CR>')
_noremap('n', '<Tab>7', '<cmd>BufferGoto 7<CR>')
_noremap('n', '<Tab>8', '<cmd>BufferGoto 8<CR>')
_noremap('n', '<Tab>9', '<cmd>BufferGoto 9<CR>')
_noremap('n', '<Tab>0', '<cmd>BufferLast<CR>')
_noremap('n', '<Tab>g', '<cmd>BufferPick<CR>')

_noremap('n', '<Tab>H', '<cmd>BufferMovePrevious<CR>')
_noremap('n', '<Tab>L', '<cmd>BufferMoveNext<CR>')

_noremap('n', '<Tab>q', '<cmd>BufferClose<CR>')

-- PLUGIN: Nvim-tree
_noremap('n', '<Leader>n', '<cmd>NvimTreeToggle<CR>')

-- PLUGIN: LSP stuffs (I don't know if there's a more proper way, contact me if you know)
-- Basic LSP stuffs
_noremap('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>')
_noremap('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<CR>')
_noremap('n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>')
_noremap('n', '<Leader>r', '<cmd>lua vim.lsp.buf.references()<CR>')
_noremap('n', '<Leader>K', '<cmd>lua vim.lsp.buf.signature_help()<CR>')
_noremap('n', '<Leader>a', '<cmd>lua vim.lsp.buf.code_action()<CR>')

-- DIAGNOSTIC:
if vim.version().minor == 5 then
  _noremap('n', '<Leader>j', '<cmd>lua vim.lsp.diagnostic.goto_next()<CR>')
  _noremap('n', '<Leader>k', '<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>')
elseif vim.version().minor == 6 then
  _noremap('n', '<Leader>j', '<cmd>lua vim.diagnostic.goto_next()<CR>')
  _noremap('n', '<Leader>k', '<cmd>lua vim.diagnostic.goto_prev()<CR>')
end

-- PLUGIN: fuGITive (the rest are provided by telescope functionality)
_noremap('n', '<Leader>gs', '<cmd>G<CR>')
_noremap('n', '<Leader>ga', '<cmd>Git add .<CR>')

-- for easy merge conflict resolving
_noremap('n', '<Leader>gh', '<cmd>diffget //2<CR>')
_noremap('n', '<Leader>gl', '<cmd>diffget //3<CR>')

-- PLUGIN: Markdown Previewer
_noremap('n', '<Leader>mp', '<cmd>MarkdownPreviewToggle<CR>')

-- PLUGIN: Tree-sitter
_noremap('n', '<Leader>tp', '<cmd>TSPlaygroundToggle<CR>')

-- PLUGIN: Telescope
_noremap('n', '<Leader>t?', '<cmd>lua require("plugin-settings.telescope.wrapper").tele_keymaps()<CR>')
_noremap('n', '<Leader>tc', '<cmd>lua require("plugin-settings.telescope.wrapper").tele_command_list()<CR>')
_noremap('n', '<Leader>tf', '<cmd>lua require("plugin-settings.telescope.wrapper").tele_find_files()<CR>')
_noremap('n', '<Leader>tb', '<cmd>lua require("plugin-settings.telescope.wrapper").tele_buffer_lists()<CR>')
_noremap(
  'n',
  '<Leader>tz',
  '<cmd>lua require("plugin-settings.telescope.wrapper").tele_current_buffer_fuzzy_find()<CR>'
)
_noremap('n', '<Leader>ts', '<cmd>lua require("plugin-settings.telescope.wrapper").tele_live_grep()<CR>')

-- Query all function names, vars, and ohter symbols from Tree Sitter queries
_noremap('n', '<Leader>tt', '<cmd>lua require("plugin-settings.telescope.wrapper").tele_treesitter()<CR>')

-- LSP in Telescope
_noremap(
  'n',
  '<Leader>tldd',
  '<cmd>lua require("plugin-settings.telescope.wrapper").tele_lsp_document_diagnostics()<CR>'
)
_noremap('n', '<Leader>tlds', '<cmd>lua require("plugin-settings.telescope.wrapper").tele_lsp_document_symbols()<CR>')
_noremap(
  'n',
  '<Leader>tlws',
  '<cmd>lua require("plugin-settings.telescope.wrapper").tele_lsp_dynamic_workspace_symbols()<CR>'
)
_noremap(
  'n',
  '<Leader>tlwd',
  '<cmd>lua require("plugin-settings.telescope.wrapper").tele_lsp_workspace_diagnostics()<CR>'
)
_noremap('n', '<Leader>tla', '<cmd>lua require("plugin-settings.telescope.wrapper").tele_lsp_range_code_actions()<CR>')
_noremap('n', '<Leader>tlgd', '<cmd>lua require("plugin-settings.telescope.wrapper").tele_lsp_definitions()<CR>')
_noremap('n', '<Leader>tlr', '<cmd>lua require("plugin-settings.telescope.wrapper").tele_lsp_references()<CR>')

-- Open quickfix list (you can send any search result from telescope to quickfix list
-- by pressing Ctrl + q while Telescope is open)
-- There are 2 ways to fill quickfix list:
--  - using any Telescope calls
--  - using vimgrep (ex: vimgrep /def/g ./*.py    -> search all 'def' in *.py file in current dir)
_noremap('n', '<Leader>tqf', '<cmd>lua require("plugin-settings.telescope.wrapper").tele_quickfix()<CR>')

-- Git in Telescope
_noremap('n', '<Leader>tgb', '<cmd>lua require("plugin-settings.telescope.wrapper").tele_git_branches()<CR>')
_noremap('n', '<Leader>tgs', '<cmd>lua require("plugin-settings.telescope.wrapper").tele_git_status()<CR>')
_noremap('n', '<Leader>tgf', '<cmd>lua require("plugin-settings.telescope.wrapper").tele_git_files()<CR>')
_noremap('n', '<Leader>tgca', '<cmd>lua require("plugin-settings.telescope.wrapper").tele_git_commits()<CR>')
_noremap('n', '<Leader>tgcb', '<cmd>lua require("plugin-settings.telescope.wrapper").tele_git_branch_diff()<CR>')

-- Emojis
_noremap('n', '<Leader>tea', '<cmd>lua require("plugin-settings.telescope.wrapper").tele_emoji_all()<CR>')
_noremap('n', '<Leader>teg', '<cmd>lua require("plugin-settings.telescope.wrapper").tele_gitmoji()<CR>')
_noremap('n', '<Leader>tee', '<cmd>lua require("plugin-settings.telescope.wrapper").tele_emoji()<CR>')
_noremap('n', '<Leader>tek', '<cmd>lua require("plugin-settings.telescope.wrapper").tele_kaomoji()<CR>')
_noremap('n', '<Leader>tP', '<cmd>lua require("plugin-settings.telescope.wrapper").tele_project()<CR>')

-- PLUGIN: VimWiki
_noremap('n', '<Leader>wj', '<cmd>VimwikiNextLink<CR>')
_noremap('n', '<Leader>wk', '<cmd>VimwikiPrevLink<CR>')
_noremap('n', '<Leader>wtl', '<cmd>VimwikiToggleListItem<CR>')
_noremap('n', '<Leader>wtbc', '<cmd>VimwikiTable<CR>')
_noremap('n', '<Leader>wtbl', '<cmd>VimwikiTableMoveColumnRight<CR>')
_noremap('n', '<Leader>wtbh', '<cmd>VimwikiTableMoveColumnLeft<CR>')
_noremap('n', '<Leader>wa', '<cmd>VimwikiAll2HTML<CR>')
_noremap('n', '<CR><CR>', '<cmd>VimwikiFollowLink<CR>')
_noremap('n', '<CR>s', '<cmd>VimwikiSplitLink<CR>')
_noremap('n', '<CR>v', '<cmd>VimwikiVSplitLink<CR>')

-- PLUGIN: Vim-Visual-Multi
-- Must be done according to documentation likewise:
-- 1. Declare empty global table
-- 2. Fill in the remapping as needed
-- 3. All default mapping that are unchanged will still be available
vim.g.VM_default_mappings = 0
vim.g.VM_maps = {
  ['Find Under'] = '<M-C-m>',
  ['Select Cursor Down'] = '<M-C-Down>',
  ['Select Cursor Up'] = '<M-C-Up>',
}

-- Enable mouse support for creating cursors
-- Left-Click = Spawn cursor
-- Right-Click = Spawn cursor, selecting the next word
vim.g.VM_mouse_mappings = true

-- PLUGIN: Formatter.nvim
_noremap('n', '<Leader>ff', '<cmd>Format<CR>')

-- PLUGIN: Nvim-Dap (debug adapter)
_noremap('n', '<Leader>da', '<cmd>lua require("plugin-settings.nvim-dap").attach_debugger()<CR>')
_noremap('n', '<Leader>db', '<cmd>lua require("dap").toggle_breakpoint()<CR>')
_noremap('n', '<Leader>do', '<cmd>lua require("dap").step_out()<CR>')
_noremap('n', '<Leader>dj', '<cmd>lua require("dap").step_over()<CR>')
_noremap('n', '<Leader>dJ', '<cmd>lua require("dap").step_into()<CR>')
_noremap('n', '<Leader>dc', '<cmd>lua require("dap").continue()<CR>')
_noremap('n', '<Leader>dK', '<cmd>lua require("plugin-settings.nvim-dap").hover()<CR>')
_noremap('n', '<Leader>dk', '<cmd>lua require("plugin-settings.nvim-dap").scopes()<CR>')
_noremap('n', '<Leader>dr', '<cmd>lua require("dap").repl.open({}, "vsplit")<CR>')

-- SOME HELPER FUNCTIONALITY
_noremap('n', '<C-s>', '<cmd>lua require("plugin-settings.telescope.wrapper").tele_snippets()<CR>')
_noremap('i', '<C-s>', '<cmd>lua require("plugin-settings.telescope.wrapper").tele_snippets()<CR>')
_noremap('n', '<Leader>th', '<cmd>lua require("plugin-settings.telescope.wrapper").tele_help()<CR>')

-- MY TELESCOPE PICKERS
_noremap('n', '<Leader>ssh', '<cmd>lua require("plugin-settings.telescope.distant").open()<CR>')
