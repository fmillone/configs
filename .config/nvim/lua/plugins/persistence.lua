return {
  "folke/persistence.nvim",
  event = "BufReadPre",
  opts = {
    options = {
      "buffers",
      "curdir",
      "tabpages",
      "winsize",
      "help",
      "globals",
      "skiprtp",
    },
  },
  -- stylua: ignore
  keys = {
    {
      "<leader>qs",
      function()
        require("neo-tree.command").execute({ action = "close" })
        require("persistence").load()
        require("neo-tree.command").execute({ action = "show" })
      end,
      desc = "Restore Session"
    },
  },
}
