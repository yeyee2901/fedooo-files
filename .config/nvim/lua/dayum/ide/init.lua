local result_cmp, cmp_ok = pcall(require, 'cmp')
local result_lsp, lsp_ok = pcall(require, 'lspconfig')
local result_ts, ts_ok = pcall(require, 'nvim-treesitter')

if cmp_ok and lsp_ok and ts_ok then
  require 'dayum.ide.treesitter'
  require 'dayum.ide.lsp'
  require 'dayum.ide.cmp'
end
