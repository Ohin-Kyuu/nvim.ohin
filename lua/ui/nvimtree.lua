local base = require("nvchad.configs.nvimtree")

local overrides = {
  git = {
    enable = true,
  },
  renderer = {
    highlight_git = "name",
    icons = {
      show = {
        git = true,
      },
    },
  },
}

return vim.tbl_deep_extend("force", base, overrides)
