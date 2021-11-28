local M = {}

local dap = require 'dap'
local dap_widgets = require 'dap.ui.widgets'

-- define custom sign for breakpoint
vim.fn.sign_define('DapBreakpoint', { text = '🛑' })
vim.fn.sign_define('DapStopped', { text = '🟩' })

dap.adapters.node2 = {
  type = 'executable',
  command = 'node',
  args = { os.getenv 'HOME' .. '/bin/vscode-node-debug2/out/src/nodeDebug.js' },
}

dap.configurations.javascript = {
  {
    type = 'node2',
    request = 'launch',
    program = '${file}',
    cwd = vim.fn.getcwd(),
    sourceMaps = true,
    protocol = 'inspector',
    console = 'integratedTerminal',
  },
  {
    -- For this to work you need to make sure the node process is started with the `--inspect` flag.
    name = 'Attach to process',
    type = 'node2',
    request = 'attach',
    processId = require('dap.utils').pick_process,
  },
}

-- TODO: debugger for python - cpp - rust
local debuggers = { 'node2' }
M.attach_debugger = function()
  vim.ui.select(debuggers, { prompt = 'Select the debugger, currently available: ' }, function(selected_debugger, index)
    if not selected_debugger then
      return
    end

    print('\n "' .. selected_debugger .. '" debugger attached...')
    dap.run {
      type = selected_debugger,
      request = 'attach',
      cwd = vim.fn.getcwd(),
      sourceMaps = true,
      protocol = 'inspector',
      skipFiles = { '<node_internals>/**/*.js' },
    }
  end)
end

M.hover = function()
  dap_widgets.hover()
end

M.scopes = function()
  dap_widgets.centered_float(dap_widgets.scopes)
end

return M
