if true then
  return {}
end

return {
  {
    "ray-x/lsp_signature.nvim",
    event = "VeryLazy",
    opts = {
      handler_opts = {
        border = "rounded",
      },
    },
    config = function(_, opts)
      require("lsp_signature").setup(opts)
    end,
  },
}
