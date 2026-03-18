-- This file needs to have same structure as nvconfig.lua
-- https://github.com/NvChad/ui/blob/v3.0/lua/nvconfig.lua
-- Please read that file to know all available options :(

---@type ChadrcConfig

---@class M
local M = {}

M.base46 = {
  theme = "decay",
  theme_toggle = { "decay", "tokyonight" },

  hl_override = {
    -- 	Comment = { italic = true },
    -- 	["@comment"] = { italic = true },
    -- 	Telescope
    TelescopeBorder = { fg = "grey" },
    TelescopePromptBorder = { fg = "blue" },
    TelescopePromptTitle = { fg = "black", bg = "blue", bold = true },
    TelescopePreviewTitle = { fg = "black", bg = "grey", bold = true },
    TelescopeResultsTitle = { fg = "black", bg = "green", bold = true },
    CursorLineNr = { fg = "#b5a26a" },
  },

  hl_add = {
    -- Custom colors for Indent Blankline & Animation
    IblScope = { fg = "#5C8F9F" },
  },
}

-- M.nvdash = { load_on_startup = true }

M.ui = {
  tree = {
    open_on_startup = true,
  },

  telescope = {
    style = "bordered",
  }, -- borderless / bordered

  -- tabufline
  -- term
}

M.plugins = "custom.plugins"
return M
