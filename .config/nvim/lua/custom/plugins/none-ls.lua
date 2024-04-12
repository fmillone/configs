return {
  'nvimtools/none-ls.nvim',
  opts = {
    sources = {},
  },
  config = function(_, opts)
    local null_ls = require 'null-ls'
    if type(opts.sources) == 'table' then
      vim.list_extend(opts.sources, {
        null_ls.builtins.code_actions.gitsigns,
        null_ls.builtins.code_actions.refactoring,
      })
    end
    null_ls.setup(opts)
  end,
}
