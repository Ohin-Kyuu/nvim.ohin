require "nvchad.options"

-- add yours here!

-- local o = vim.o
-- o.cursorlineopt ='both' -- to enable cursorline!

local o = vim.opt
o.number = true
o.relativenumber = true
o.cursorline = true
o.cursorlineopt = "both"
o.pumheight = 10
o.completeopt = { "menu", "menuone", "noselect" }
