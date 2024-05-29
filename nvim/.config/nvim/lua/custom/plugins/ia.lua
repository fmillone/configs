return {
  {
    'Exafunction/codeium.nvim',
    build = ':Codeium Auth',
    dependencies = {
      'nvim-lua/plenary.nvim',
      'hrsh7th/nvim-cmp',
    },
    opts = {
      enable_chat = true,
    },
  },
  {
    'zbirenbaum/copilot.lua',
    cmd = 'Copilot',
    event = 'InsertEnter',
    build = ':Copilot auth',
    opts = {
      suggestion = { enabled = false },
      panel = { enabled = false },
      filetypes = {
        markdown = true,
        help = true,
      },
    },
  },
  {
    'zbirenbaum/copilot-cmp',
    dependencies = 'zbirenbaum/copilot.lua',
    config = function()
      require('copilot_cmp').setup()
    end,
  },
}
