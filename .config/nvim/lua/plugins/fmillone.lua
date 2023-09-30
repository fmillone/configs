return {
  "fmillone/string-quotes.nvim",
  --dir = "~/repo/string-quotes.nvim",
  event = "BufReadPre",
  opts = {
    disabled = false,
  },
  dependencies = {
    "nvimtools/none-ls.nvim",
  },
}
