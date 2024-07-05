local function js_formatter()
  if vim.fn.glob 'dprint.json' ~= '' then
    return { 'dprint' }
  elseif vim.fn.glob 'deno.json' ~= '' then
    return { 'deno fmt' }
  elseif vim.fn.glob '.prettierrc' ~= '' then
    return { 'prettier' }
  elseif vim.fn.glob 'biome.json' ~= '' then
    return { 'biome' }
  end
end

return {
  { -- Autoformat
    'stevearc/conform.nvim',
    opts = {
      notify_on_error = false,
      format_on_save = function(bufnr)
        -- Disable "format_on_save lsp_fallback" for languages that don't
        -- have a well standardized coding style. You can add additional
        -- languages here or re-enable it for the disabled ones.
        local disable_filetypes = { c = true, cpp = true }
        return {
          timeout_ms = 500,
          lsp_fallback = not disable_filetypes[vim.bo[bufnr].filetype],
        }
      end,
      formatters_by_ft = {
        lua = { 'stylua' },
        -- Conform can also run multiple formatters sequentially
        -- python = { "isort", "black" },
        --
        javascript = js_formatter,
        javascriptreact = js_formatter,
        typescript = js_formatter,
        typescriptreact = js_formatter,
        vue = js_formatter,
        less = { 'prettier' },
        html = { 'prettier' },
        graphql = { 'prettier' },
        handlebars = { 'prettier' },
        -- You can use a sub-list to tell conform to run *until* a formatter
        -- is found.
        -- javascript = { { "prettierd", "prettier" } },
        sh = { 'shfmt' },
        bash = { 'shfmt' },
        zsh = { 'shfmt' },
      },
      formatters = {
        shfmt = {
          prepend_args = { '-i', '2' },
        },
      },
    },
  },
}
