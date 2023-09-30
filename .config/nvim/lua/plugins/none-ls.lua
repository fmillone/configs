return {
  "nvimtools/none-ls.nvim",
  optional = true,
  opts = function(_, opts)
    if type(opts.sources) == "table" then
      local null_ls = require("null-ls")
      vim.print("Using none-ls.nvim")
      vim.list_extend(opts.sources, {
        null_ls.builtins.code_actions.gitsigns,
        null_ls.builtins.code_actions.refactoring,
      })
    end
  end,
}
