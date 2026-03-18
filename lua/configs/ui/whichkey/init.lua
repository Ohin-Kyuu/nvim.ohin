return function(_, opts)
  opts.delay = 200
  opts.preset = "helix"

  opts.win = {
    border = "rounded",
    padding = { 1, 2 }, -- up/down, left/right pad
    no_overlap = false, -- cursor can on the window
    title_pos = "center",
  }

  opts.layout = {
    width = { min = 20, max = 50 },
    spacing = 3,
  }

  return opts
end

