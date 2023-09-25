-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps hereby
local float_win = function()
  require("lsp_signature").toggle_float_win()
end
vim.keymap.set({ "n" }, "<C-x>", float_win, { silent = true, noremap = true, desc = "toggle signature" })
vim.keymap.set(
  "n",
  "<leader>ghi",
  "<cmd>Gitsigns toggle_signs<CR>",
  { silent = true, noremap = true, desc = "toggle signs" }
)
vim.keymap.set(
  "n",
  "<leader>gha",
  "<cmd>Gitsigns toggle_current_line_blame<CR>",
  { silent = true, noremap = true, desc = "toggle current line blame" }
)
vim.keymap.set(
  "n",
  "<leader>ghl",
  "<cmd>Gitsigns toggle_linehl<CR>",
  { silent = true, noremap = true, desc = "toggle linehl" }
)
vim.keymap.set(
  "n",
  "<leader>ghn",
  "<cmd>Gitsigns toggle_numhl<CR>",
  { silent = true, noremap = true, desc = "toggle numhl" }
)
vim.keymap.set(
  "n",
  "<leader>ghw",
  "<cmd>Gitsigns toggle_word_diff<CR>",
  { silent = true, noremap = true, desc = "toggle word diff" }
)
vim.keymap.set(
  "n",
  "<leader>ghx",
  "<cmd>Gitsigns toggle_deleted<CR>",
  { silent = true, noremap = true, desc = "toggle deleted" }
)
vim.keymap.set({ "n", "x" }, "<leader>rr", function()
  require("refactoring").select_refactor()
end, { desc = "Refactor" })
