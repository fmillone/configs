return {
  {
    "zbirenbaum/copilot.lua",
    cmd = "Copilot",
    build = ":Copilot auth",
    opts = {
      suggestion = {
        enabled = false,
        auto_trigger = true,
        debounce = 75,
        -- keymap = {
        -- accept = "<C-l>",
        -- accept_word = false,
        -- accept_line = false,
        -- next = "<C-_>",
        -- prev = "<M-[>",
        -- dismiss = "<C-]>",
        -- },
      },
      panel = {
        enabled = true,
        auto_refresh = true,
        -- keymap = {
        -- jump_prev = "[[",
        -- jump_next = "]]",
        --     accept = "<CR>",
        --     refresh = "gr",
        -- open = "<C-l>",
        -- },
        -- layout = {
        -- position = "bottom", -- | top | left | right
        --     ratio = 0.4,
        --   },
      },
      filetypes = {
        markdown = true,
        help = true,
        VimspectorPrompt = false,
      },
    },
  },
  {
    "zbirenbaum/copilot-cmp",
    dependencies = "copilot.lua",
    opts = {},
    config = function(_, opts)
      local copilot_cmp = require("copilot_cmp")
      copilot_cmp.setup(opts)
      -- attach cmp source whenever copilot attaches
      -- fixes lazy-loading issues with the copilot cmp source
      require("lazyvim.util").on_attach(function(client)
        if client.name == "copilot" then
          copilot_cmp._on_insert_enter({})
        end
      end)
    end,
  },
}
