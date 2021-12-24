-- Treesitter --
require('nvim-treesitter.configs').setup {

  ensure_installed = {
    'lua',
    'bash',
    'cpp',
    'c',
    'rust',
    'html',
    'css',
    'javascript',
    'typescript',
    'tsx',
    'php',
    'python',
    'vim',
    'toml',
    'json',
    'query',
    'jsdoc',
    'latex',
    'comment',
  },

  highlight = {
    enable = true,
    disable = { 'markdown', 'latex', 'html', 'php' },
    additional_vim_regex_highlighting = false,
  },

  indent = {
    enable = false,
  },

  incremental_selection = {
    enable = true,
    keymaps = {
      init_selection = 'gnn',
      node_incremental = 'grn',
      scope_incremental = 'grc',
      node_decremental = 'grm',
    },
  },

  -- Custom text objects
  textobjects = {
    select = {
      enable = true,
      lookahead = true,

      keymaps = {

        -- around function
        ['af'] = '@function.outer',

        -- inside function
        ['if'] = '@function.inner',

        -- around class
        ['ac'] = '@class.outer',

        -- inside class
        ['ic'] = '@class.inner',
      },
    },
  },
}
