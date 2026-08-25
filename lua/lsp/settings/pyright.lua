return {
  on_init = function(client)
    local root = client.workspace_folders[1].name
    local venv = root .. "/.venv/bin/python"

    if vim.fn.filereadable(venv) == 1 then
      client.config.settings.python.pythonPath = venv
      client.notify("workspace/didChangeConfiguration", {
        settings = client.config.settings,
      })
    end
  end,

  settings = {
    python = {
      analysis = {
        typeCheckingMode = "off",
        autoSearchPaths = true,
        useLibraryCodeForTypes = true,
      },
    },
  },
}
