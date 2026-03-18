return {
  settings = {
    systemverilog = {
      linter = "verilator", 
      launchConfiguration = "verilator -sv -Wall --timing --lint-only",
      includePath = {
        ".",
        "include",
        "src",
      },

      defines = {},
    },
  },
}