local execute = vim.api.nvim_command
local fn = vim.fn

-- Ensure that packer is always installed in new machine
-- Might differ on macOS & winOS
local install_path = fn.stdpath 'data' .. '/site/pack/packer/start/packer.nvim'
local new_install = false

if fn.empty(fn.glob(install_path)) > 0 then
  print '[PACKER] Packer not yet installed'
  print('[PACKER] Now installing packer in' .. install_path)
  fn.system { 'git', 'clone', 'https://github.com/wbthomason/packer.nvim', install_path }
  execute 'packadd packer.nvim'
  new_install = true
end

require('packer').startup(function()
  -- WARNING: Packer self management, DO NOT REMOVE
  use { 'wbthomason/packer.nvim' }

  -- Start menu
  use { 'mhinz/vim-startify' }

  -- UI Stuffs
  use { 'kyazdani42/nvim-web-devicons' }
  use { 'hoob3rt/lualine.nvim' }
  use { 'romgrk/barbar.nvim' }
  use { 'ishan9299/nvim-solarized-lua' }

  -- Colorizer for color codes like this one -> #ff0000
  use { 'norcalli/nvim-colorizer.lua' }

  -- File tree explorer
  use { 'kyazdani42/nvim-tree.lua' }

  -- LSP (Language Server)
  use { 'neovim/nvim-lspconfig' }
  use { 'ray-x/lsp_signature.nvim' }

  -- Completion engine
  use { 'SirVer/ultisnips' }
  use { 'honza/vim-snippets' }
  use { 'hrsh7th/nvim-cmp' }
  use { 'hrsh7th/cmp-nvim-lua' }
  use { 'hrsh7th/cmp-nvim-lsp' }
  use { 'hrsh7th/cmp-buffer' }
  use { 'hrsh7th/cmp-path' }
  use { 'quangnguyen30192/cmp-nvim-ultisnips' }
  use { 'onsails/lspkind-nvim' } -- for labels & icons

  -- Tree Sitter
  use { 'nvim-treesitter/nvim-treesitter' }
  use { 'nvim-treesitter/playground' }
  use { 'nvim-treesitter/nvim-treesitter-textobjects' }

  -- Telescopeee, behold the most overpowered plugin of the year
  use { 'nvim-lua/popup.nvim' }
  use { 'nvim-lua/plenary.nvim' }
  use { 'nvim-telescope/telescope.nvim' }
  use { 'nvim-telescope/telescope-symbols.nvim' }
  use { 'nvim-telescope/telescope-fzy-native.nvim' }
  use { 'fhill2/telescope-ultisnips.nvim' }
  use { 'nvim-telescope/telescope-project.nvim' }

  -- UTILS
  -- Git it gud
  use { 'tpope/vim-fugitive' }

  -- Bracket stuffs
  use { 'jiangmiao/auto-pairs' }
  use { 'tpope/vim-surround' }

  -- Commentary
  use { 'tpope/vim-commentary' }

  -- Visual Multi
  use { 'mg979/vim-visual-multi' }

  -- Note taking
  use { 'vimwiki/vimwiki' }

  -- Distant.nvim
  -- remote development like Visual Studio Code Remote
  use { 'chipsenkbeil/distant.nvim' }

  -- formatter
  -- builtin formatter from LSPs is not so good
  use { 'mhartington/formatter.nvim' }

  -- debugger
  use { 'mfussenegger/nvim-dap' }

  -- startup time
  use { 'dstein64/vim-startuptime' }
end)

if new_install then
  vim.cmd 'PackerInstall'
end
