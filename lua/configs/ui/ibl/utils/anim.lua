local M = {}

local uv = vim.uv or vim.loop
local ns = vim.api.nvim_create_namespace "ibl_scope_anim"
local timer = nil
local prev_scope = { buf = nil, start = nil, finish = nil }

local BLOCK_NODES = {
  "table_constructor",
  "if_statement",
  "for_statement",
  "while_statement",
  "function_declaration",
  "function_definition",
  "method_declaration",
  "do_statement",
  "repeat_statement",
  "class_body",
  "arguments",
  "function_call",

  "module_declaration",
  "always_construct",
  "seq_block",
  "initial_construct",
  "case_statement",
  "task_declaration",
  "generate_region",
}

local SKIP_NODES = {
  "assignment_statement",
  "local_declaration",
  "variable_declaration",
  "expression_statement",
  "return_statement",
  "comment",
}

local EXCLUDED_FT = {
  "help",
  "terminal",
  "lazy",
  "lspinfo",
  "TelescopePrompt",
  "TelescopeResults",
  "mason",
  "nvdash",
  "nvcheatsheet",
  "notify",
  "nvimtree",
  "",
}

local function get_current_scope()
  local cursor = vim.api.nvim_win_get_cursor(0)

  local ok, node = pcall(vim.treesitter.get_node, {
    pos = { cursor[1] - 1, cursor[2] },
  })
  if not ok or not node then
    return nil
  end

  ---@type TSNode?
  local check = node
  while check do
    local t = check:type()
    if vim.tbl_contains(SKIP_NODES, t) then
      return nil
    end
    if vim.tbl_contains(BLOCK_NODES, t) then
      break
    end
    check = check:parent()
  end
  while node do
    if vim.tbl_contains(BLOCK_NODES, node:type()) then
      local sr, _, er, _ = node:range()
      if er - sr >= 2 then
        local shiftwidth = vim.bo.shiftwidth > 0 and vim.bo.shiftwidth or vim.bo.tabstop
        local inner_indent = nil

        for i = sr + 1, er - 1 do
          local line = vim.api.nvim_buf_get_lines(0, i, i + 1, false)[1] or ""
          if line:match "%S" then
            inner_indent = vim.fn.indent(i + 1)
            break
          end
        end

        if not inner_indent then
          inner_indent = vim.fn.indent(sr + 1) + shiftwidth
        end

        local col = math.max(0, inner_indent - shiftwidth)

        return { start = sr, finish = er, col = col }
      end
    end
    node = node:parent()
  end
  return nil
end

local function animate_scope(scope, buf)
  if timer then
    timer:stop()
    timer:close()
    timer = nil
  end

  vim.api.nvim_buf_clear_namespace(buf, ns, 0, -1)

  local target_start = scope.start + 1
  local target_finish = scope.finish - 1
  if target_start > target_finish then
    return
  end

  local cursor_row = vim.api.nvim_win_get_cursor(0)[1] - 1
  local top = math.min(target_finish, math.max(target_start, cursor_row))
  local bot = top
  local step = 1

  timer = uv.new_timer()
  timer:start(
    0,
    24,
    vim.schedule_wrap(function()
      if not timer then
        return
      end

      if not vim.api.nvim_buf_is_valid(buf) or buf ~= vim.api.nvim_get_current_buf() then
        if timer then
          timer:stop()
          timer:close()
          timer = nil
        end
        pcall(vim.api.nvim_buf_clear_namespace, buf, ns, 0, -1)
        return
      end

      vim.api.nvim_buf_clear_namespace(buf, ns, 0, -1)

      for i = top, bot do
        vim.api.nvim_buf_set_extmark(buf, ns, i, 0, {
          virt_text = { { "│", "IblScope" } },
          virt_text_win_col = scope.col,
          hl_mode = "combine",
          priority = 1026,
        })
      end

      if top <= target_start and bot >= target_finish then
        if timer then
          timer:stop()
          timer:close()
          timer = nil
        end
        return
      end

      top = math.max(target_start, top - step)
      bot = math.min(target_finish, bot + step)
    end)
  )
end

function M.setup()
  vim.api.nvim_create_autocmd({ "CursorMoved", "CursorMovedI" }, {
    callback = function()
      if vim.tbl_contains(EXCLUDED_FT, vim.bo.filetype) then
        return
      end

      local buf = vim.api.nvim_get_current_buf()
      local scope = get_current_scope()

      if not scope then
        vim.api.nvim_buf_clear_namespace(buf, ns, 0, -1)
        prev_scope = { buf = nil, start = nil, finish = nil }
        return
      end

      if prev_scope.buf == buf and prev_scope.start == scope.start and prev_scope.finish == scope.finish then
        return
      end

      prev_scope = { buf = buf, start = scope.start, finish = scope.finish }
      animate_scope(scope, buf)
    end,
  })
end

return M
