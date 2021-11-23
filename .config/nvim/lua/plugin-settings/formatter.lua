-- install prettier globally
local prettier = function()
  return {
    exe = "./node_modules/.bin/prettier",
    stdin = true,
    args = {
      "--stdin-filepath",
      vim.api.nvim_buf_get_name(0)
    }
  }
end

require('formatter').setup({
  logging = true,
  filetype = {
    html = { prettier },
    css = { prettier },
    json = { prettier },
    markdown = { prettier },
    javascript = { prettier },
    javascriptreact = { prettier },
    typescript = { prettier },
    typescriptreact = { prettier }
  }
})
