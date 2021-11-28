-- SECTION: Ultisnips Snippet engine
-- Calling ExpandTrigger,
-- will make nvim-cmp completion behave
-- like a UltiSnips placeholder.
-- this is possible because nvim-cmp has complete snippet support

local options = {
	UltiSnipsExpandTrigger = "<M-CR>",
	UltiSnipsJumpForwardTrigger = "<M-CR>",
	UltiSnipsJumpBackwardTrigger = "<M-BS>",
	UltiSnipsListSnippets = "<C-?>",
	UltiSnipsEditSplit = "vertical",
}

for opt, val in pairs(options) do
	vim.g[opt] = val
end

-- SECTION: Nvim-Cmp Autocomplete engine
local cmp = require("cmp")

vim.o.completeopt = "menuone,noselect"

cmp.setup({
	completion = {
		completeopt = vim.o.completeopt,
	},

	mapping = {
		["<C-n>"] = cmp.mapping.select_next_item(),
		["<C-p>"] = cmp.mapping.select_prev_item(),
		["<C-b>"] = cmp.mapping.scroll_docs(-4),
		["<C-f>"] = cmp.mapping.scroll_docs(4),
		["<C-q>"] = cmp.mapping.close(),
		["<C-c>"] = cmp.mapping.complete(), -- open completion menu
		["<Tab>"] = cmp.mapping.confirm({
			behavior = cmp.ConfirmBehavior.Insert,
			select = true,
		}),
	},

	documentation = {
		border = "rounded",
		winhighlight = "NormalFloat:CompeDocumentation,FloatBorder:CompeDocumentationBorder",
		max_width = 100,
		min_width = 60,
		max_height = math.floor(vim.o.lines * 0.3),
		min_height = 1,
	},

	-- LSP context icon like VSCode
	-- INSTALL:
	-- onsails/lspkind-nvim
  --
	formatting = {
		format = function(entry, vim_item)
			vim_item.kind = require("lspkind").presets.default[vim_item.kind]

			-- Label the source
			vim_item.menu = ({
				buffer = "[Buffer]",
				nvim_lsp = "[LSP]",
				nvim_lua = "[Lua]",
				path = "[Path]",
				ultisnips = "[Snippet]",
			})[entry.source.name]

			return vim_item
		end,
	},

	sources = {
		-- { name = 'buffer' },
		{ name = "path" },
		{ name = "nvim_lsp" },
		{ name = "nvim_lua" },
		{ name = "ultisnips" },
	},

	-- INSTALL:
	-- quangnguyen30192/cmp-nvim-ultisnips
	snippet = {
		expand = function(args)
			vim.fn["UltiSnips#Anon"](args.body)
		end,
	},

	-- EXPERIMENTAL:
	experimental = {
		ghost_text = false,
		native_menu = false,
	},
})

-- LSP START
-- If you want to install & activate the LSP, go to:
--      https://github.com/neovim/nvim-lspconfig/blob/master/CONFIG.md

-- SECTION: DIAGNOSTICS
--   error_sign = '',
--   warn_sign = '',
--   hint_sign = '',
--   infor_sign = '',

vim.fn.sign_define("LspDiagnosticsSignError", { text = "", numhl = "Error", linehl = "Error" })
vim.fn.sign_define("LspDiagnosticsSignWarning", { text = "", numhl = "Todo", texthl = "Todo" })
vim.fn.sign_define("LspDiagnosticsSignHint", { text = "", numhl = "Todo", texthl = "Todo" })
vim.fn.sign_define("LspDiagnosticsSignInformation", { text = "", numhl = "Todo", texthl = "Todo" })

vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(vim.lsp.diagnostic.on_publish_diagnostics, {
	virtual_text = true,
	signs = true,
	underline = true,
})

local lspconfig = require("lspconfig")
local util = require("lspconfig").util

local custom_on_attach = function(client, bufnr)
	-- Better function signature hinting
	require("lsp_signature").on_attach({
		bind = true, -- Mandatory for config
		doc_lines = 5,
		fix_pos = false,
		hint_enable = true,
		hint_prefix = "<> ",
		hint_scheme = "String",

		hi_parameter = "Search",
		max_height = 12,
		max_width = 120,
		handler_opts = {
			border = "double", -- single/double/shadow
		},

		-- The signature floating_window is reaaaallyy big, and i have to
		-- disable it so I can read the completion pop up menu
		floating_window = false,

		-- WARNING: Glepnir is inactive for > 8 months, so there won't be any
		-- bug fixes
		use_lspsaga = false,
	})

	-- autoformat on save
	-- disable for tsserver, will use prettier instead
	if client.name == "tsserver" or client.name == "ccls" or client.name == "html" or client.name == "cssls" then
		client.resolved_capabilities.document_formatting = false
	end

	if client.resolved_capabilities.document_formatting then
		vim.cmd([[autocmd BufWritePost <buffer> lua vim.lsp.buf.formatting_seq_sync()]])
	end
end

-- LSPSaga by Glepnir
-- WARNING: Glepnir is inactive for > 8 months, so there won't be any
-- bug fixes! Use at your own risk!

-- local lsp_saga = require 'lspsaga'
-- lsp_saga.init_lsp_saga {
--   use_saga_diagnostic_sign = true,
--   error_sign = '',
--   warn_sign = '',
--   hint_sign = '',
--   infor_sign = '',
--   dianostic_header_icon = '[ERROR]  ',
--   max_preview_lines = 10, -- preview lines for provider functions.
--   code_action_prompt = {
--     enable = false,
--   },
--   border_style = 'round',
-- }

-- update LSP capabilities for nvim-cmp
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require("cmp_nvim_lsp").update_capabilities(capabilities)
capabilities.snippetSupport = true

lspconfig.rust_analyzer.setup({
	filetypes = { "rust" },
	on_attach = custom_on_attach,
	capabilities = capabilities,
})

lspconfig.ccls.setup({
	filetypes = { "c", "cpp", "objc", "objcpp" },
	on_attach = custom_on_attach,
	capabilities = capabilities,
})

lspconfig.vimls.setup({
	filetypes = { "vim" },
	on_attach = custom_on_attach,
	capabilities = capabilities,
})

lspconfig.pyright.setup({
	filetypes = { "python" },
	on_attach = custom_on_attach,
	capabilities = capabilities,
})

lspconfig.bashls.setup({
	filetypes = { "sh", "zsh" },
	on_attach = custom_on_attach,
	capabilities = capabilities,
})

lspconfig.cmake.setup({
	filetypes = { "cmake" },
	on_attach = custom_on_attach,
})

lspconfig.html.setup({
	on_attach = custom_on_attach,
	capabilities = capabilities,
})

lspconfig.cssls.setup({
	on_attach = custom_on_attach,
	capabilities = capabilities,
})

lspconfig.tsserver.setup({
	on_attach = custom_on_attach,
	capabilities = capabilities,
	init_options = { hostInfo = "neovim" },
	filetypes = {
		"javascript",
		"javascriptreact",
		"javascript.jsx",
		"typescript",
		"typescriptreact",
		"typescript.tsx",
	},

	-- to prioritize tsconfig.json for root directory
	root_dir = function(fname)
		return util.root_pattern("tsconfig.json")(fname)
			or util.root_pattern("package.json", "jsconfig.json", ".git")(fname)
	end,
})

-- now eslint is supported as per October update
lspconfig.eslint.setup({
	filetypes = {
		"javascript",
		"javascriptreact",
		"javascript.jsx",
		"typescript",
		"typescriptreact",
		"typescript.tsx",
	},
	settings = {
		codeAction = {
			disableRuleComment = {
				enable = true,
				location = "separateLine",
			},
			showDocumentation = {
				enable = true,
			},
		},
		codeActionOnSave = {
			enable = false,
			mode = "all",
		},
		format = true,
		nodePath = "",
		onIgnoredFiles = "off",
		packageManager = "npm",
		quiet = false,
		rulesCustomizations = {},
		run = "onType",
		useESLintClass = false,
		validate = "on",
		workingDirectory = {
			mode = "auto",
		},
	},
})

lspconfig.intelephense.setup({
	on_attach = custom_on_attach,
	capabilities = capabilities,
})

-- Treesitter --
require("nvim-treesitter.configs").setup({

	ensure_installed = {
		"lua",
		"bash",
		"cpp",
		"c",
		"html",
		"css",
		"javascript",
		"typescript",
		"tsx",
		"php",
		"python",
		"vim",
		"toml",
		"json",
		"latex",
		"comment",
	},

	highlight = {
		enable = true,

		-- ISSUE: Markdown Breaks some text highlighting
		-- For some reason, php has better syntax highlighting without TS,
		-- might be an issue for my colorscheme though
		disable = { "markdown", "latex", "html", "php" },
		additional_vim_regex_highlighting = false,
	},

	indent = {
		enable = false,
	},

	incremental_selection = {
		enable = true,
		keymaps = {
			init_selection = "gnn",
			node_incremental = "grn",
			scope_incremental = "grc",
			node_decremental = "grm",
		},
	},

	-- Custom text objects
	textobjects = {
		select = {
			enable = true,
			lookahead = true,

			keymaps = {

				-- around function
				["af"] = "@function.outer",

				-- inside function
				["if"] = "@function.inner",

				-- around class
				["ac"] = "@class.outer",

				-- inside class
				["ic"] = "@class.inner",
			},
		},
	},
})
