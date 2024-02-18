-- bootstrap lazy.nvim, LazyVim and your plugins
vim.g.VM_default_mappings = 0
vim.opt.title = true

require("config.lazy")
require("myplugins.copyPath")
