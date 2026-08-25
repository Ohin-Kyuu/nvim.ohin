local dap = require "dap"

-- ui
require "configs.code.dap.ui"

-- debuggers
local codelldb = require "configs.code.dap.adapters.codelldb"

dap.adapters.codelldb = codelldb.adapter

dap.configurations.c = codelldb.config
dap.configurations.cpp = codelldb.config
dap.configurations.rust = codelldb.config
