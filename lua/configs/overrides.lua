local M = {}

-- local cmp = require "cmp"

M.mason = {
  ensure_installed = {
    -- Lua
    "lua-language-server",
    "stylua",

    -- CPP
    "clangd",
    "clang-format",
    "codelldb",

    -- Python
    "ruff",
    "pyright",

    -- Verilog
    "svlangserver",
    "verible",
  },
}

M.treesitter = {
  ensure_installed = {
    "vim",
    "lua",
    "c",
    "cpp",
    "python",
    "yaml",
    "json",
    "make",
    "bash",
    "markdown",
    "html",
    "css",
    "systemverilog",
  },
  highlight = {
    enable = true,
    use_languagetree = true,
  },
  indent = { enable = true },
}

M.lspconfig = {}

M.dapconfig = {
  ensure_installed = {
    -- CPP
    "codelldb",
  },

  handlers = {},
}

return M
