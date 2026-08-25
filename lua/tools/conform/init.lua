local options = {
  formatters_by_ft = {
    lua = { "stylua" },
    c = { "clang-format" },
    cpp = { "clang-format" },
    python = { "ruff_fix", "ruff_format", "ruff_organize_imports" },
    verilog = { "verible" },
    systemverilog = { "verible" },
    -- css = { "prettier" },
    -- html = { "prettier" },
  },

  format_on_save = function(bufnr)
    if vim.g.disable_autoformat or vim.b[bufnr].disable_autoformat then
      return
    end
    return {
      -- These options will be passed to conform.format()
      timeout_ms = 2000,
      lsp_fallback = true,
    }
  end,
}

require("conform").setup(options)
require("configs.code.conform.utils.toggle_save").create_toggle_command()
