-- SECTION: Ultisnips Snippet engine
-- Calling ExpandTrigger,
-- will make nvim-cmp completion behave
-- like a UltiSnips placeholder.
-- this is possible because nvim-cmp has complete snippet support

local options = {
  UltiSnipsExpandTrigger = '<M-CR>',
  UltiSnipsJumpForwardTrigger = '<M-CR>',
  UltiSnipsJumpBackwardTrigger = '<M-BS>',
  UltiSnipsListSnippets = '<C-?>',
  UltiSnipsEditSplit = 'vertical',
}

for opt, val in pairs(options) do
  vim.g[opt] = val
end

-- SECTION: Nvim-Cmp Autocomplete engine
local cmp = require 'cmp'

vim.o.completeopt = 'menuone,noselect'

cmp.setup {
  completion = {
    completeopt = vim.o.completeopt,
  },

  mapping = {
    ['<C-n>'] = cmp.mapping.select_next_item(),
    ['<C-p>'] = cmp.mapping.select_prev_item(),
    ['<C-b>'] = cmp.mapping.scroll_docs(-4),
    ['<C-f>'] = cmp.mapping.scroll_docs(4),
    ['<C-q>'] = cmp.mapping.close(),
    ['<C-c>'] = cmp.mapping.complete(), -- open completion menu
    ['<Tab>'] = cmp.mapping.confirm {
      behavior = cmp.ConfirmBehavior.Insert,
      select = true,
    },
  },

  documentation = {
    border = 'rounded',
    winhighlight = 'NormalFloat:CompeDocumentation,FloatBorder:CompeDocumentationBorder',
    max_width = 100,
    min_width = 60,
    max_height = math.floor(vim.o.lines * 0.3),
    min_height = 1,
  },

  -- short format
  formatting = {
    fields = { 'kind', 'abbr' },
    format = function(_, vim_item)
      vim_item.kind = require('lspkind').presets.default[vim_item.kind] or ''
      return vim_item
    end,
  },

  -- long format
  -- formatting = {
  --   fields = { 'abbr', 'kind' },
  --   format = function(entry, vim_item)
  --     vim_item.kind = string.format('%s [%s]', icons[vim_item.kind], vim_item.kind)

  --     -- Label the source
  --     vim_item.menu = ({
  --       buffer = '[Buffer]',
  --       nvim_lsp = '[LSP]',
  --       nvim_lua = '[Lua]',
  --       path = '[Path]',
  --       ultisnips = '[Snippet]',
  --     })[entry.source.name]

  --     return vim_item
  --   end,
  -- },

  sources = {
    -- { name = 'buffer' },
    --    { name = 'path' },
    { name = 'nvim_lsp' },
    { name = 'nvim_lua' },
    { name = 'ultisnips' },
  },

  -- INSTALL:
  -- quangnguyen30192/cmp-nvim-ultisnips
  snippet = {
    expand = function(args)
      vim.fn['UltiSnips#Anon'](args.body)
    end,
  },

  -- EXPERIMENTAL:
  experimental = {
    ghost_text = false,
    native_menu = false,
  },
}
