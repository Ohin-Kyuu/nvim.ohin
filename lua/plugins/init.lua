return {

  -- Notify
  {
    "rcarriga/nvim-notify",
    lazy = false,
    config = function()
      require "ui.notify"
    end,
  },

  -- Treesitter
  {
    "nvim-treesitter/nvim-treesitter",
    opts = require "configs.treesitter",
  },

  -- LSP
  {
    "neovim/nvim-lspconfig",
    config = function()
      require "lsp"
    end,
  },

  {
    "mason-org/mason-lspconfig.nvim",
    opts = require "configs.lsp",
    dependencies = {
      { "mason-org/mason.nvim", opts = require "configs.mason" },
      "neovim/nvim-lspconfig",
    },
  },

  -- DAP
  {
    "mfussenegger/nvim-dap",
    lazy = false,
    config = function()
      require "tools.dap"
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
    opts = require "configs.dap",
    dependencies = {
      { "mason-org/mason.nvim", opts = require "configs.mason" },
      "mfussenegger/nvim-dap",
    },
  },

  -- Formatter
  {
    "stevearc/conform.nvim",
    event = "BufWritePre", -- uncomment for format on save
    config = function()
      require "tools.conform"
    end,
  },

  -- cmp
  {
    "hrsh7th/nvim-cmp",
    opts = require "completion",
  },

  -- Telescope
  {
    "nvim-telescope/telescope.nvim",
    opts = require "ui.telescope",
  },

  -- Which-Key
  {
    "folke/which-key.nvim",
    event = "VeryLazy",
    opts = require "ui.whichkey",
  },

  -- Indent-Blankline
  {
    "lukas-reineke/indent-blankline.nvim",
    event = "User FilePost",
    opts = require "ui.ibl",
    config = function(_, opts)
      dofile(vim.g.base46_cache .. "blankline")
      require("ibl").setup(opts)
    end,
  },

  -- nvim-ufo
  {
    "kevinhwang91/nvim-ufo",
    dependencies = "kevinhwang91/promise-async",
    event = "BufReadPost",
    config = function()
      require("ui.ufo").setup()
    end,
  },

  -- image.nvim
  {
    "3rd/image.nvim",
    build = false,
    lazy = false,
    config = function()
      require "ui.image"
    end,
  },
}
