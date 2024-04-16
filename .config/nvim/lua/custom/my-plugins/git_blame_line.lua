-- From lazyvim ( https://github.com/LazyVim/LazyVim/blob/bb36f71b77d8e15788a5b62c82a1c9ec7b209e49/lua/lazyvim/util/lazygit.lua#L144)
local function blame_line()
  local opts = {
    count = 4,
    filetype = 'git',
    size = {
      width = 0.6,
      height = 0.6,
    },
    border = 'rounded',
  }
  local cursor = vim.api.nvim_win_get_cursor(0)
  local line = cursor[1] - 1
  local file = vim.api.nvim_buf_get_name(0)
  local cmd = { 'git', 'log', '-n', opts.count, '-u', '-L', line .. ',+1:' .. file }
  return require('lazy.util').float_cmd(cmd, opts)
end

vim.keymap.set({ 'n' }, '<leader>gbl', blame_line, { desc = '[G]it [B]lame [L]ine' })
