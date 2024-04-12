vim.keymap.set({ "n" }, "<leader>yp", function()
  local address = vim.fn.expand("%") .. ":" .. vim.fn.line(".") .. ":" .. vim.fn.col(".")
  vim.fn.setreg("+", address)
  vim.print(address)
end, { desc = "Copy current file path" })

vim.keymap.set({ "n" }, "<leader>yP", function()
  local address = vim.fn.expand("%:p") .. ":" .. vim.fn.line(".") .. ":" .. vim.fn.col(".")
  vim.fn.setreg("+", address)
  vim.print(address)
end, { desc = "Copy current file full path" })