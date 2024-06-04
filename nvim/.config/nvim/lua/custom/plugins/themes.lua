local function set_colorscheme()
  if vim.fn.has 'macunix' ~= 0 then
    vim.cmd.colorscheme 'tokyonight-night'
  else
    vim.cmd.colorscheme 'onedark'
  end
end

return {
  {
    'folke/tokyonight.nvim',
    priority = 1000, -- Make sure to load this before all the other start plugins.
    init = set_colorscheme,
  },
  { 'EdenEast/nightfox.nvim' },
  {
    'navarasu/onedark.nvim',
    priority = 1000, -- Make sure to load this before all the other start plugins.
    init = set_colorscheme,
    opts = {
      style = 'darker',
    },
  },
}
