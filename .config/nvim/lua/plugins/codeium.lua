return {
  {
    "nvim-cmp",
    opts = function(_, opts)
      table.insert(opts.sources, {
        name = "codeium",
        group_index = 2,
        keyword_length = 0,
        max_item_count = 3,
        priority = 10,
      })
    end,
  },
}
