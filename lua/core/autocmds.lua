require "nvchad.autocmds"

vim.api.nvim_create_autocmd("VimEnter", {
  once = true,
  callback = function()
    local ok, err = pcall(function()
      local api = require("nvim-tree.api")
      api.tree.open()
    end)
    if not ok then
      -- silently ignore if nvim-tree cannot open
    end
  end,
})
