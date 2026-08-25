local base = require "nvchad.configs.lspconfig"

local on_attach = base.on_attach
local on_init = base.on_init
local capabilities = base.capabilities

local servers = { "lua_ls", "clangd", "ruff", "pyright", "svlangserver" }

for _, server in ipairs(servers) do
  local opts = {
    on_attach = on_attach,
    on_init = on_init,
    capabilities = capabilities,
  }

  local settings_mod = "lsp.settings." .. server
  local _ok, settings = pcall(require, settings_mod)
  if not _ok then
    settings_mod = "configs.lsp.settings." .. server
    _ok, settings = pcall(require, settings_mod)
  end

  if _ok then
    opts = vim.tbl_deep_extend("force", opts, settings)
  end

  vim.lsp.config(server, opts)
  vim.lsp.enable(server)
end

local config = {
  virtual_text = true,
  underline = true,
  update_in_insert = false,
  severity_sort = true,
  float = {
    focusable = false,
    style = "minimal",
    border = "single",
    source = "always",
  },
}

vim.diagnostic.config(config)
