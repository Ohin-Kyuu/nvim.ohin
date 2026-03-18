return function(_, opts)
  opts.defaults.layout_strategy = "horizontal"
  opts.defaults.layout_config = {
    horizontal = {
      prompt_position = "bottom",
      preview_width = 0.55,
      results_width = 0.8,
    },
  }

  opts.defaults.file_ignore_patterns = {
    "node_modules",
    ".git",
    "%.o",
  }

  return opts
end

