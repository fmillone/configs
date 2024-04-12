return {
  {
    "navarasu/onedark.nvim",
    priority = 1000,
    opts = {
      style = "darker",
      toggle_style_key = "<leader>ut",
      toggle_style_list = { "deep", "darker" }, -- List of styles to toggle between
    },
    init = function()
      vim.cmd.colorscheme("onedark")
    end,
  },
  { "EdenEast/nightfox.nvim" },
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "onedark",
    },
  },
}
