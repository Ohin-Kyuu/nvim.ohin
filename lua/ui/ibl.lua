return {
  indent = {
    char = "│",
    highlight = { "IblChar" },
  },
  -- Disable IBL's built-in scope to use the custom animated one instead
  scope = {
    enabled = false,
  },
  exclude = {
    filetypes = {
      "help",
      "terminal",
      "lazy",
      "lspinfo",
      "TelescopePrompt",
      "TelescopeResults",
      "mason",
      "nvdash",
      "nvcheatsheet",
      "notify",
      "nvimtree",
      "",
    },
    buftypes = { "terminal", "nofile" },
  },
}
