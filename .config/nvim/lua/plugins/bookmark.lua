return {
  "tomasky/bookmarks.nvim",
  event = "VimEnter",
  opts = {
    sign_priority = 9999, --set bookmark sign priority to cover other sign
    linehl = true,
    numhl = true,
    signcolumn = true,
    keywords = {
      ["@t"] = "☑️ ", -- mark annotation startswith @t ,signs this icon as `Todo`
      ["@w"] = "⚠️ ", -- mark annotation startswith @w ,signs this icon as `Warn`
      ["@f"] = "⛏ ", -- mark annotation startswith @f ,signs this icon as `Fix`
      ["@n"] = " ", -- mark annotation startswith @n ,signs this icon as `Note`
    },
    on_attach = function(_)
      local bm = require("bookmarks")
      local map = vim.keymap.set
      map("n", "mm", bm.bookmark_toggle, { desc = "toggle bookmark" }) -- add or remove bookmark at current line
      map("n", "mi", bm.bookmark_ann, { desc = "annotate" }) -- add or edit mark annotation at current line
      map("n", "mc", bm.bookmark_clean, { desc = "clean all in buffer" }) -- clean all marks in local buffer
      map("n", "mn", bm.bookmark_next, { desc = "next" }) -- jump to next mark in local buffer
      map("n", "mp", bm.bookmark_prev, { desc = "previous" }) -- jump to previous mark in local buffer
      map("n", "ml", bm.bookmark_list, { desc = "list" }) -- show marked file list in quickfix window
      map("n", "mt", bm.toggle_signs, { desc = "signs" }) -- show marked file list in quickfix window
    end,
  },
  config = function(_, opts)
    require("bookmarks").setup(opts)
    require("telescope").load_extension("bookmarks")
  end,
}
