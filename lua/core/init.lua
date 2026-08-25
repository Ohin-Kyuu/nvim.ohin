vim.g.mapleader = " "

-- NvChad base
require "nvchad.options"
require "nvchad.autocmds"
require "nvchad.mappings"

-- Custom core
require "core.options"
require "core.autocmds"
require "core.keymaps"

-- UI
require "ui"

-- Defer LSP / tools until after startup to avoid blocking
vim.schedule(function()
  -- treesitter is lazy by event, no explicit load needed
  require "lsp"
  require "tools.dap"
end)
