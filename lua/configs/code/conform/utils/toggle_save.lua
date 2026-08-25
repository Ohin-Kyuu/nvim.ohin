local M = {}

-- We export a function that sets up the commands
function M.create_toggle_command()
  -- 1. Notification Helper
  local function show_notification(message, level)
    vim.notify(message, vim.log.levels[level:upper()], { title = "conform.nvim" })
  end

  -- 2. Create the Toggle Command
  vim.api.nvim_create_user_command("FormatToggle", function(args)
    local is_global = not args.bang

    if is_global then
      vim.g.disable_autoformat = not vim.g.disable_autoformat
      if vim.g.disable_autoformat then
        show_notification("Autoformat-on-save disabled globally", "info")
      else
        show_notification("Autoformat-on-save enabled globally", "info")
      end
    else
      vim.b.disable_autoformat = not vim.b.disable_autoformat
      if vim.b.disable_autoformat then
        show_notification("Autoformat-on-save disabled for this buffer", "info")
      else
        show_notification("Autoformat-on-save enabled for this buffer", "info")
      end
    end
  end, {
    desc = "Toggle autoformat-on-save",
    bang = true,
  })
end

return M
