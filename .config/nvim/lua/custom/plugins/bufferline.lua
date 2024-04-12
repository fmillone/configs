return {
  {
    'akinsho/bufferline.nvim',
    version = '*',
    -- event = 'VeryLazy',
    dependencies = 'nvim-tree/nvim-web-devicons',
    opts = {
      options = {
        indicator = {
          style = 'icon',
        },
        separator_style = 'slant',
        diagnostics = 'nvim_lsp',
        diagnostics_indicator = function(count, level, _, _)
          local icon = level:match 'error' and ' ' or ' '
          return ' ' .. icon .. count
        end,
      },
    },
    vim.keymap.set('n', '<leader>bp', '<Cmd>BufferLineTogglePin<CR>', { desc = 'Toggle Pin' }),
    vim.keymap.set('n', '<leader>bP', '<Cmd>BufferLineGroupClose ungrouped<CR>', { desc = 'Delete Non-Pinned Buffers' }),
    vim.keymap.set('n', '<S-h>', '<cmd>BufferLineCyclePrev<cr>', { desc = 'Prev Buffer' }),
    vim.keymap.set('n', '<S-l>', '<cmd>BufferLineCycleNext<cr>', { desc = 'Next Buffer' }),
  },
}
