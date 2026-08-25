local base_on_attach = require("nvchad.configs.lspconfig").on_attach

return {
  on_attach = function(client, bufnr)
    client.server_capabilities.hoverProvider = false

    base_on_attach(client, bufnr)
  end,
}
