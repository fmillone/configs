return {
  {
    "nvim-cmp",
    opts = function(_, opts)
      table.insert(opts.sources, {
        name = "copilot",
        group_index = 2,
        keyword_length = 0,
        priority = 10,
      })
    end,
  },
}
