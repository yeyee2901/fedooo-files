-- LSP START
-- If you want to install & activate the LSP, go to:
--      https://github.com/neovim/nvim-lspconfig/blob/master/CONFIG.md

-- SECTION: DIAGNOSTICS
--   error_sign = '',
--   warn_sign = '',
--   hint_sign = '',
--   infor_sign = '',

-- For neovim 0.6, the diagnostic is now in vim.diagnostic
if vim.version().minor == 5 then
  vim.fn.sign_define('LspDiagnosticsSignError', { text = '', numhl = 'Error', linehl = 'Error' })
  vim.fn.sign_define('LspDiagnosticsSignWarning', { text = '', numhl = 'Todo', texthl = 'Todo' })
  vim.fn.sign_define('LspDiagnosticsSignHint', { text = '', numhl = 'Todo', texthl = 'Todo' })
  vim.fn.sign_define('LspDiagnosticsSignInformation', { text = '', numhl = 'Todo', texthl = 'Todo' })

  vim.lsp.handlers['textDocument/publishDiagnostics'] = vim.lsp.with(vim.lsp.diagnostic.on_publish_diagnostics, {
    virtual_text = true,
    signs = true,
    underline = true,
  })
elseif vim.version().minor == 6 then
  vim.fn.sign_define(
    'DiagnosticSignError',
    { text = '', texthl = 'DiagnosticSignError', linehl = 'DiagnosticSignError', numhl = 'DiagnosticSignError' }
  )

  vim.fn.sign_define(
    'DiagnosticSignWarn',
    { text = '', texthl = 'DiagnosticSignWarn', numhl = 'DiagnosticSignWarn' }
  )

  vim.fn.sign_define(
    'DiagnosticSignInfo',
    { text = '', texthl = 'DiagnosticSignInfo', numhl = 'DiagnosticSignInfo' }
  )

  vim.fn.sign_define(
    'DiagnosticSignHint',
    { text = '', texthl = 'DiagnosticSignHint', numhl = 'DiagnosticSignHint' }
  )

  -- New setup call for 0.6
  vim.diagnostic.config {
    signs = true,
    virtual_text = {
      source = 'always',
    },
  }
end

-- SECTION: LSP
local lspconfig = require 'lspconfig'
local util = require('lspconfig').util

local custom_on_attach = function(client, bufnr)
  -- Better function signature hinting
  require('lsp_signature').on_attach {
    bind = true, -- Mandatory for config
    doc_lines = 5,
    fix_pos = false,
    hint_enable = true,
    hint_prefix = '<> ',
    hint_scheme = 'String',

    hi_parameter = 'Search',
    max_height = 12,
    max_width = 120,
    handler_opts = {
      border = 'double', -- single/double/shadow
    },

    -- The signature floating_window is reaaaallyy big, and i have to
    -- disable it so I can read the completion pop up menu
    floating_window = false,

    -- WARNING: Glepnir is inactive for > 8 months, so there won't be any
    -- bug fixes
    use_lspsaga = false,
  }

  -- autoformat on save
  -- disable for some pre-configured formatter
  if
    client.name == 'tsserver' -- use prettier instead
    or client.name == 'html' -- use prettier instead
    or client.name == 'cssls' -- use prettier instead
    or client.name == 'ccls' -- use clang-format instead
    or client.name == 'rust_analyzer' -- use custom styled rustfmt instead
  then
    client.resolved_capabilities.document_formatting = false
  end

  -- if LSP has `document_formatting` method support, then create
  -- autocommands for formatting on save
  if client.resolved_capabilities.document_formatting then
    vim.cmd [[autocmd BufWritePost <buffer> lua vim.lsp.buf.formatting_seq_sync()]]
  end
end

-- update LSP capabilities to include nvim-cmp (completion)
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require('cmp_nvim_lsp').update_capabilities(capabilities)
capabilities.snippetSupport = true

lspconfig.rust_analyzer.setup {
  filetypes = { 'rust' },
  on_attach = custom_on_attach,
  capabilities = capabilities,
}

lspconfig.ccls.setup {
  filetypes = { 'c', 'cpp', 'objc', 'objcpp' },
  on_attach = custom_on_attach,
  capabilities = capabilities,
}

lspconfig.vimls.setup {
  filetypes = { 'vim' },
  on_attach = custom_on_attach,
  capabilities = capabilities,
}

lspconfig.pyright.setup {
  filetypes = { 'python' },
  on_attach = custom_on_attach,
  capabilities = capabilities,
}

lspconfig.bashls.setup {
  filetypes = { 'sh', 'zsh' },
  on_attach = custom_on_attach,
  capabilities = capabilities,
}

lspconfig.cmake.setup {
  filetypes = { 'cmake' },
  on_attach = custom_on_attach,
}

lspconfig.html.setup {
  on_attach = custom_on_attach,
  capabilities = capabilities,
}

lspconfig.cssls.setup {
  on_attach = custom_on_attach,
  capabilities = capabilities,
}

lspconfig.tsserver.setup {
  on_attach = custom_on_attach,
  capabilities = capabilities,
  init_options = { hostInfo = 'neovim' },
  filetypes = {
    'javascript',
    'javascriptreact',
    'javascript.jsx',
    'typescript',
    'typescriptreact',
    'typescript.tsx',
  },

  -- to prioritize tsconfig.json for root directory
  root_dir = function(fname)
    return util.root_pattern 'tsconfig.json'(fname) or util.root_pattern('package.json', 'jsconfig.json', '.git')(fname)
  end,
}

-- now eslint is supported as per October update
lspconfig.eslint.setup {
  filetypes = {
    'javascript',
    'javascriptreact',
    'javascript.jsx',
    'typescript',
    'typescriptreact',
    'typescript.tsx',
  },
  settings = {
    codeAction = {
      disableRuleComment = {
        enable = true,
        location = 'separateLine',
      },
      showDocumentation = {
        enable = true,
      },
    },
    codeActionOnSave = {
      enable = false,
      mode = 'all',
    },
    format = true,
    nodePath = '',
    onIgnoredFiles = 'off',
    packageManager = 'npm',
    quiet = false,
    rulesCustomizations = {},
    run = 'onType',
    useESLintClass = false,
    validate = 'on',
    workingDirectory = {
      mode = 'auto',
    },
  },
}

-- npm i -g intelephense
lspconfig.intelephense.setup {
  on_attach = custom_on_attach,
  capabilities = capabilities,
}

-- Sumneko Lua Language Server
local runtime_path = vim.split(package.path, ';')
table.insert(runtime_path, 'lua/?.lua')
table.insert(runtime_path, 'lua/?/init.lua')

lspconfig.sumneko_lua.setup {
  on_attach = custom_on_attach,
  capabilities = capabilities,

  settings = {
    Lua = {
      runtime = {
        -- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
        version = 'LuaJIT',
        -- Setup your lua path
        path = runtime_path,
      },
      diagnostics = {
        -- Get the language server to recognize the `vim` global
        globals = { 'vim' },
      },
      workspace = {
        -- Make the server aware of Neovim runtime files
        library = vim.api.nvim_get_runtime_file('', true),
      },
      -- Do not send telemetry data containing a randomized but unique identifier
      telemetry = {
        enable = false,
      },
    },
  },
}
