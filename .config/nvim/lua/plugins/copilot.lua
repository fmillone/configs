return {
  {
    "nvim-cmp",
    opts = function(_, opts)
      local copilot = require("utils.table").findSource(opts.sources, "copilot")
      if copilot then
        copilot.priority = 4
        copilot.keyword_length = 0
        copilot.group_index = 1
        copilot.max_item_count = 4
      end
    end,
  },
}
