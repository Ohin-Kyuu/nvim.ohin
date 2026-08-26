require "nvchad.autocmds"

vim.api.nvim_create_autocmd({ "BufNew", "BufNewFile", "BufRead", "TabEnter", "TermOpen" }, {
  pattern = "*",
  group = vim.api.nvim_create_augroup("TabuflineLazyLoad", { clear = true }),
  callback = function()
    if #vim.fn.getbufinfo { buflisted = 1 } >= 1 or #vim.api.nvim_list_tabpages() >= 2 then
      vim.o.showtabline = 2
      vim.o.tabline = "%!v:lua.require('nvchad.tabufline.modules')()"
      vim.api.nvim_del_augroup_by_name "TabuflineLazyLoad"
      dofile(vim.g.base46_cache .. "tbline")
    end
  end,
})
