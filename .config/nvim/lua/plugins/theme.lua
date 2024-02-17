return {
  {
    "navarasu/onedark.nvim",
    opts = {
      style = "darker",
      toggle_style_key = "<leader>ut",
      toggle_style_list = { "deep", "darker" }, -- List of styles to toggle between
    },
  },
  { "EdenEast/nightfox.nvim" },
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "onedark",
    },
  },
}
