local overrides = require "configs.overrides"

return {

  -- Notify
  {
    "rcarriga/nvim-notify",
    lazy = false,
    config = function()
      require "configs.ui.notify"
    end,
  },

  -- NvimTree
  {
    "nvim-tree/nvim-tree.lua",
    version = false,
    lazy = false,
    opts = overrides.nvimtree,
    dependencies = {
      { "nvim-tree/nvim-web-devicons", lazy = true },
    },
  },

  -- Treesitter
  {
    "nvim-treesitter/nvim-treesitter",
    opts = overrides.treesitter,
  },

  -- LSP
  {
    "neovim/nvim-lspconfig",
    config = function()
      require "configs.code.lsp"
    end,
  },

  {
    "mason-org/mason-lspconfig.nvim",
    opts = overrides.lspconfig,
    dependencies = {
      { "mason-org/mason.nvim", opts = {} },
      "neovim/nvim-lspconfig",
    },
  },

  -- DAP
  {
    "mfussenegger/nvim-dap",
    lazy = false,
    config = function()
      require "configs.code.dap"
    end,
  },

  {
    "rcarriga/nvim-dap-ui",
    event = "VeryLazy",
    config = function()
      require("dapui").setup()
    end,
    dependencies = {
      "mfussenegger/nvim-dap",
      "nvim-neotest/nvim-nio",
    },
  },

  {
    "jay-babu/mason-nvim-dap.nvim",
    event = "VeryLazy",
    opts = overrides.dapconfig,
    dependencies = {
      { "mason-org/mason.nvim", opts = {} },
      "mfussenegger/nvim-dap",
    },
  },

  -- Formatter
  {
    "stevearc/conform.nvim",
    event = "BufWritePre", -- uncomment for format on save
    config = function()
      require "configs.code.conform"
    end,
  },

  -- cmp
  {
    "hrsh7th/nvim-cmp",
    opts = require "configs.code.cmp",
  },

  -- Telescope
  {
    "nvim-telescope/telescope.nvim",
    opts = require "configs.ui.telescope",
  },

  -- Which-Key
  {
    "folke/which-key.nvim",
    event = "VeryLazy",
    opts = require "configs.ui.whichkey",
  },

  -- Indent-Blankline
  {
    "lukas-reineke/indent-blankline.nvim",
    event = "User FilePost",
    opts = require "configs.ui.ibl",
    config = function(_, opts)
      dofile(vim.g.base46_cache .. "blankline")
      require("ibl").setup(opts)
      require("configs.ui.ibl.utils.anim").setup()
    end,
  },

  -- nvim-ufo
  {
    "kevinhwang91/nvim-ufo",
    dependencies = "kevinhwang91/promise-async",
    event = "BufReadPost",
    config = function()
      require("configs.ui.ufo").setup()
    end,
  },
}
