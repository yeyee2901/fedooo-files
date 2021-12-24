local M = {}

local builtin = require 'telescope.builtin'
local themes = require 'telescope.themes'
local ultisnips = require('telescope').extensions.ultisnips
local project = require('telescope').extensions.project
local default_theme = 'get_ivy' -- {"get_ivy", "get_dropdown", "get_cursor"}
local default_height = 0.6

M.tele_keymaps = function()
  builtin.keymaps(themes[default_theme] {
    prompt_title = '< Keymap Search >',
    layout_config = {
      height = default_height,
    },
  })
end

M.tele_command_list = function()
  builtin.commands(themes['get_dropdown'] {
    prompt_title = '< Available Commands >',
  })
end

M.tele_find_files = function()
  builtin.find_files(themes[default_theme] {
    prompt_title = '< File Finder >',
    layout_config = {
      height = default_height,
    },
  })
end

M.tele_buffer_lists = function()
  builtin.buffers(themes[default_theme] {
    prompt_title = '< Buffer List >',
    layout_config = {
      height = default_height,
    },
  })
end

M.tele_current_buffer_fuzzy_find = function()
  builtin.current_buffer_fuzzy_find(themes[default_theme] {
    prompt_title = '< Buffer Fuzzy Finder >',
    layout_config = {
      height = default_height,
    },
  })
end

M.tele_live_grep = function()
  builtin.live_grep(themes[default_theme] {
    prompt_title = '< Grep String >',
    layout_config = {
      height = default_height,
    },
  })
end

M.tele_treesitter = function()
  builtin.treesitter(themes[default_theme] {
    prompt_title = '< Treesitter Symbols >',
    layout_config = {
      height = default_height,
    },
  })
end

M.tele_lsp_document_symbols = function()
  builtin.lsp_document_symbols(themes[default_theme] {
    prompt_title = '< Document Symbols >',
    layout_config = {
      height = default_height,
    },
  })
end

M.tele_lsp_document_diagnostics = function()
  builtin.lsp_document_diagnostics(themes[default_theme] {
    prompt_title = '< Document Diagnostics >',
    layout_config = {
      height = default_height,
    },
  })
end

M.tele_lsp_dynamic_workspace_symbols = function()
  builtin.lsp_dynamic_workspace_symbols(themes[default_theme] {
    prompt_title = '< Workspace Symbols >',
    layout_config = {
      height = default_height,
    },
  })
end

M.tele_lsp_workspace_diagnostics = function()
  builtin.lsp_workspace_diagnostics(themes[default_theme] {
    prompt_title = '< Workspace Diagnostics >',
    layout_config = {
      height = default_height,
    },
  })
end

M.tele_lsp_range_code_actions = function()
  builtin.lsp_range_code_actions(themes['get_dropdown'] {
    prompt_title = '< Suggested Code Actions >',
  })
end

M.tele_lsp_definitions = function()
  builtin.lsp_definitions(themes[default_theme] {
    prompt_title = '< Definitions >',
    layout_config = {
      height = default_height,
    },
  })
end

M.tele_lsp_references = function()
  builtin.lsp_references(themes[default_theme] {
    prompt_title = '< References >',
    layout_config = {
      height = default_height,
    },
  })
end

M.tele_quickfix = function()
  builtin.quickfix(themes[default_theme] {
    prompt_title = '< Quickfix Lists >',
    layout_config = {
      height = default_height,
    },
  })
end

M.tele_git_branches = function()
  builtin.git_branches(themes[default_theme] {
    prompt_tile = '< Git Branches >',
    layout_config = {
      height = default_height,
    },
  })
end

M.tele_git_status = function()
  builtin.git_status(themes[default_theme] {
    prompt_title = '< Git Status >',
    layout_config = {
      height = default_height,
    },
  })
end

M.tele_git_files = function()
  builtin.git_files(themes[default_theme] {
    prompt_title = '< Git Files >',
    layout_config = {
      height = default_height,
    },
  })
end

M.tele_git_branch_diff = function()
  builtin.git_bcommits(themes['get_dropdown'] {
    prompt_title = '< Buffer Diff View >',
  })
end

M.tele_git_commits = function()
  builtin.git_commits(themes['get_dropdown'] {
    prompt_title = '< Git Commits Log >',
  })
end

M.tele_snippets = function()
  ultisnips.ultisnips(themes[default_theme] {
    prompt_title = '< Available Snippets >',
    layout_config = {
      height = default_height,
    },
  })
end

M.tele_emoji_all = function()
  builtin.symbols(themes[default_theme] {
    prompt_title = '< Available Snippets >',
    sources = {
      'emoji',
      'gitmoji',
      'kaomoji',
    },
    layout_config = {
      height = default_height,
    },
  })
end

M.tele_gitmoji = function()
  builtin.symbols(themes[default_theme] {
    prompt_title = '< Available Snippets >',
    sources = {
      'gitmoji',
    },
    layout_config = {
      height = default_height,
    },
  })
end

M.tele_emoji = function()
  builtin.symbols(themes[default_theme] {
    prompt_title = '< Available Snippets >',
    sources = {
      'emoji',
    },
    layout_config = {
      height = default_height,
    },
  })
end

M.tele_kaomoji = function()
  builtin.symbols(themes[default_theme] {
    prompt_title = '< Available Snippets >',
    sources = {
      'kaomoji',
    },
    layout_config = {
      height = default_height,
    },
  })
end

M.tele_project = function()
  project.project {
    display_type = 'full',
  }
end

M.tele_help = function()
  builtin.help_tags(themes['get_dropdown'] {
    prompt_title = '< Search for Help >',
  })
end

return M
