-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps hereby
local float_win = function()
  require("lsp_signature").toggle_float_win()
end
vim.keymap.set({ "n" }, "<C-x>", float_win, { silent = true, noremap = true, desc = "toggle signature" })
