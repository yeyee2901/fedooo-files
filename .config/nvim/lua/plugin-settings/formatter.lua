-- install prettier in your projects
local prettier = function()
  return {
    exe = './node_modules/.bin/prettier',
    stdin = true,
    args = {
      '--stdin-filepath',
      vim.api.nvim_buf_get_name(0),
    },
  }
end

-- npm i -g clang-format
local clang_format = function()
  return {
    exe = 'clang-format',
    stdin = true,
    args = { vim.api.nvim_buf_get_name(0) },
  }
end

-- pip3 install autopep8
local autopep = function()
  return {
    exe = 'autopep8',
    stdin = true,
    args = { vim.api.nvim_buf_get_name(0) },
  }
end

local stylua = function()
  return {
    exe = 'stylua',
    stdin = false,
    args = { vim.api.nvim_buf_get_name(0) },
  }
end

require('formatter').setup {
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

    python = { autopep },

    lua = { stylua },
  },
}
