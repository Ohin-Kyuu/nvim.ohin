local base_on_attach = require("nvchad.configs.lspconfig").on_attach

return {
  on_attach = function(client, bufnr)
    client.server_capabilities.hoverProvider = false
    client.server_capabilities.documentFormattingProvider = false
    client.server_capabilities.documentRangeFormattingProvider = false

    base_on_attach(client, bufnr)
  end,
}
