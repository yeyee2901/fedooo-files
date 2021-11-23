-- install prettier in your projects
local prettier = function()
	return {
		exe = "./node_modules/.bin/prettier",
		stdin = true,
		args = {
			"--stdin-filepath",
			vim.api.nvim_buf_get_name(0),
		},
	}
end

-- install clang-format globally
local clang_format = function()
	return {
		exe = "clang-format",
		stdin = true,
		args = { vim.api.nvim_buf_get_name(0) },  -- format the current file
	}
end

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
		html = { prettier },
		css = { prettier },
		json = { prettier },
		markdown = { prettier },
		javascript = { prettier },
		javascriptreact = { prettier },
		typescript = { prettier },
		typescriptreact = { prettier },

		c = { clang_format },
		cpp = { clang_format },

		lua = { stylua },
	},
})
