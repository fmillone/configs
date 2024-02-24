return {
  {
    "nvim-telescope/telescope.nvim",
    optional = true,
    opts = function(_, opts)
      opts.defaults.layout_strategy = "vertical"
    end,
  },
}
