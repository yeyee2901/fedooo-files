local stylua = function()
	return {
		exe = "stylua",
		stdin = false,
		args = { vim.api.nvim_buf_get_name(0) },
	}
end

require("formatter").setup({
	logging = true,
	filetype = {
		--    html = { prettier },
		--    css = { prettier },
		--    json = { prettier },
		--    markdown = { prettier },
		--    javascript = { prettier },
		--    javascriptreact = { prettier },
		--    typescript = { prettier },
		--    typescriptreact = { prettier },
		--
		--    c = { clang_format },
		--    cpp = { clang_format },
		--
		--    python = { autopep },
		--
		--    rust = { rustfmt },

		lua = { stylua },
	},
})
