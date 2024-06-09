return {
  {
    'nvim-lualine/lualine.nvim',
    dependencies = {
      'nvim-tree/nvim-web-devicons',
      'folke/noice.nvim',
      'folke/trouble.nvim',
    },
    opts = function()
      local trouble = require 'trouble'
      local symbols = trouble.statusline {
        mode = 'lsp_document_symbols',
        groups = {},
        title = false,
        filter = { range = true },
        format = '{kind_icon}{symbol.name:Normal}',
      }
      local oil = require 'oil'
      local oil_status = {
        has = function()
          return vim.bo.filetype == 'oil'
        end,
        get = function()
          return oil.get_current_dir()
        end,
      }
      local noice_status = require('noice').api.status.mode
      return {
        options = {
          icons_enabled = true,
          theme = 'auto',
          component_separators = { left = '\\', right = '/' },
          section_separators = { left = '', right = '' },
        },
        sections = {
          lualine_a = { 'mode' },
          lualine_b = { 'branch', 'diff', 'diagnostics' },
          lualine_c = { 'filename' },
          lualine_x = {
            {
              noice_status.get,
              cond = noice_status.has,
              color = { fg = '#ff9e64' },
            },
          },
          lualine_y = { 'progress' },
          lualine_z = { 'location' },
        },
        tabline = {},
        winbar = {
          lualine_a = { { symbols.get, cond = symbols.has } },
          lualine_b = { { oil_status.get, cond = oil_status.has } },
          lualine_y = { 'encoding', 'fileformat', 'filetype' },
        },
      }
    end,
  },
}
