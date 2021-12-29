local fn = vim.fn
local install_path = fn.stdpath 'data' .. '/site/pack/packer/start/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
  packer_bootstrap = fn.system {
    'git',
    'clone',
    '--depth',
    '1',
    'https://github.com/wbthomason/packer.nvim',
    install_path,
  }
end

require('packer').startup(function(use)
  -- My plugins here
  -- use 'foo1/bar1.nvim'
  -- use 'foo2/bar2.nvim'
  use { 'wbthomason/packer.nvim' }

  -- THEME
  use { 'marko-cerovac/material.nvim' }
  use { 'nvim-lualine/lualine.nvim' }
  use { 'kyazdani42/nvim-web-devicons' }
  use { 'romgrk/barbar.nvim' }
  use { 'kyazdani42/nvim-tree.lua' }

  -- IDE
  use { 'onsails/lspkind-nvim' }
  use { 'nvim-treesitter/nvim-treesitter' }
  use { 'honza/vim-snippets' }
  use { 'SirVer/ultisnips' }
  use { 'hrsh7th/nvim-cmp' }
  use { 'hrsh7th/cmp-nvim-lsp' }
  use { 'hrsh7th/cmp-nvim-lua' }
  use { 'quangnguyen30192/cmp-nvim-ultisnips' }

  use { 'neovim/nvim-lspconfig' }
  use { 'ray-x/lsp_signature.nvim' }

  use { 'nvim-treesitter/playground' }

  -- TELESCOPE
  use { 'nvim-lua/plenary.nvim' }
  use { 'fhill2/telescope-ultisnips.nvim' }

  use {
    'nvim-telescope/telescope.nvim',
    config = function()
      require 'dayum.plugins.telescope'
    end,
  }

  -- STARTIFY
  use { 'mhinz/vim-startify' }

  -- FORMATTER
  use {
    'mhartington/formatter.nvim',
    config = function()
      require 'dayum.plugins.formatter'
    end,
  }

  -- GIT SUPERPOWER
  use { 'tpope/vim-fugitive' }
  use {
    'lewis6991/gitsigns.nvim',
    config = function()
      require 'dayum.plugins.gitsigns'
    end,
  }

  -- NOTE TAKING
  use {
    'vimwiki/vimwiki',
    config = function()
      vim.cmd [[source $HOME/.config/nvim/lua/dayum/plugins/vimwiki.vim]]
    end,
  }

  -- CSS COLOR MARKER
  use {
    'norcalli/nvim-colorizer.lua',
    config = function()
      require('colorizer').setup()
    end,
  }

  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if packer_bootstrap then
    require('packer').sync()
  end
end)
