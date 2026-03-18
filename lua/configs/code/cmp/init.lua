return function(_, opts)
  local cmp = require "cmp"

  -- Window (Rounded / Highlight)
  opts.window = {
    completion = cmp.config.window.bordered {
      border = "rounded",
      winhighlight = "Normal:NormalFloat,FloatBorder:Comment,CursorLine:CursorLine,Search:None",
    },
    documentation = cmp.config.window.bordered {
      border = "rounded",
      max_width = 30,
      max_height = 15,
      winhighlight = "Normal:Normal,FloatBorder:Comment,CursorLine:CursorLine,Search:None",
      scrollbar = true,
    },
  }

  -- Formatting
  opts.formatting = {
    format = function(entry, vim_item)
      local icons = require "nvchad.icons.lspkind"
      vim_item.kind = string.format("%s %s", icons[vim_item.kind], vim_item.kind)
      vim_item.menu = ({
        luasnip = "[Snip]",
        nvim_lsp = "[LSP]",
        buffer = "[Buf]",
        nvim_lua = "[Lua]",
        path = "[Path]",
      })[entry.source.name]

      local max_width = 30
      if #vim_item.abbr > max_width then
        vim_item.abbr = string.sub(vim_item.abbr, 1, max_width) .. "..."
      end
      return vim_item
    end,
  }

  -- Sources and Priorities
  opts.sources = {
    { name = "nvim_lsp", priority = 1000 },
    { name = "nvim_lua", priority = 800 },
    { name = "luasnip", priority = 750 },
    { name = "buffer", priority = 500 },
    { name = "path", priority = 250 },
  }

  -- Sorting Logic
  opts.sorting = {
    comparators = {
      cmp.config.compare.offset,
      cmp.config.compare.score,
      cmp.config.compare.length,
      cmp.config.compare.recently_used,
      cmp.config.compare.locality,
      cmp.config.compare.exact,
      cmp.config.compare.kind,
    },
  }

  -- Experimental
  opts.experimental = {
    ghost_text = true,
  }

  return opts
end

