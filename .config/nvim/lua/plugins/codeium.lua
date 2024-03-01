return {
  {
    "nvim-cmp",
    opts = function(_, opts)
      local codeium = require("utils.table").findSource(opts.sources, "codeium")
      if codeium then
        codeium.priority = 5
        codeium.keyword_length = 0
        codeium.group_index = 1
        codeium.max_item_count = 4
      end
    end,
  },
}
