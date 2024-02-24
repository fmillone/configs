return {
  "nvim-neo-tree/neo-tree.nvim",
  opts = {
    filesystem = {
      filtered_items = {
        always_show = {
          ".gitignore",
          ".config",
        },
        always_show_by_pattern = {
          ".config*",
        },
      },
    },
  },
}
