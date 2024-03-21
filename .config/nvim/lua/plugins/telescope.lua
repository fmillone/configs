return {
  {
    "nvim-telescope/telescope.nvim",
    optional = true,
    opts = function(_, opts)
      opts.defaults.layout_strategy = "vertical"
    end,
    config = function(_, opts)
      require("telescope").setup(opts)
      local builtin = require("telescope.builtin")
      vim.keymap.set("n", "<leader>sgs", builtin.git_status, { desc = "[S]earch in [G]it [S]tatus" })
    end,
  },
}
