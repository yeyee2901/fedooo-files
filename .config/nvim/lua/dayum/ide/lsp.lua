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

vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, {
    border = 'rounded',
})

vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, {
    border = 'rounded',
})

-- New setup call for 0.6
vim.diagnostic.config {
    signs = true,
    virtual_text = {
        source = 'always',
    },
}


local lspconfig = require 'lspconfig'


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

lspconfig.html.setup{
    capabilities = capabilities,
    on_attach = custom_on_attach
}

lspconfig.tsserver.setup {
    capabilities = capabilities,
    on_attach = custom_on_attach
}
