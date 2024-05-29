return {
  {
    'fmillone/string-quotes.nvim',
    -- dir = '~/repo/string-quotes.nvim',
    event = 'BufReadPre',
    opts = {
      disabled = false,
      filetypes = {
        'lua',
        'html',
        'typescript',
        'typescript.tsx',
        'typescriptreact',
        'javascript',
        'javascript.jsx',
        'javascriptreact',
      },
    },
    dependencies = {
      'nvimtools/none-ls.nvim',
    },
  },
  {
    'fmillone/lsp-highlight.nvim',
    -- dir = '~/repo/lsp-highlight.nvim',
    opts = {},
  },
}
