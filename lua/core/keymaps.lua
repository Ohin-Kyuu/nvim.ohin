require "nvchad.mappings"

local map = vim.keymap.set

map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>")

-- DAP
map("n", "<Leader>db", "<cmd> DapToggleBreakpoint <CR>", { desc = "Add Breakpoint at line" })
map("n", "<Leader>dr", "<cmd> DapContinue <CR>", { desc = "Start/Continue Debugger" })

-- notify
map("n", "<Leader>un", function()
  require("notify").dismiss { silent = true, pending = true }
end, { desc = "Dismiss ALL Notifications" })

-- Toggle Transparency
map("n", "<leader>tt", function()
  require("base46").toggle_transparency()
end, { desc = "Toggle transparency" })
