local function is_child_of_folder_containing(pattern, file_path)
  local path_parts = vim.split(vim.fs.normalize(file_path), '/')
  local cwd_parts = vim.split(vim.fs.normalize(vim.fn.getcwd()), '/')
  local relative_file_folder_path = vim.fs.joinpath(unpack(vim.list_slice(path_parts, #cwd_parts + 1, #path_parts)))

  local glob = vim.fn.glob(pattern, false, true)
  if #glob == 0 then
    vim.notify('no ' .. pattern)
    return false
  end
  for _, v in pairs(glob) do
    local parts = vim.split(vim.fs.normalize(v), '/')
    local base = vim.fs.joinpath(unpack(vim.list_slice(parts, 1, #parts - 1)))
    if relative_file_folder_path:find(base, 1, true) == 1 then
      return true
    end
  end
  return false
end

local function js_formatter(bufnr)
  if vim.fn.glob 'dprint.json' ~= '' then
    -- vim.notify 'format using dprint'
    return { 'dprint' }
  elseif vim.fn.glob 'deno.json' ~= '' then
    -- vim.notify 'format using Deno lsp'
    return {} --{ 'deno fmt' } -- Use lsp instead
  elseif vim.fn.glob '.prettierrc' ~= '' then
    -- vim.notify 'format using prettier'
    return { 'prettier' }
  elseif vim.fn.glob 'biome.json' ~= '' then
    -- vim.notify 'format using biome'
    return { 'biome' }
  else
    -- check for monorepo pattern
    local buff_abs_path = vim.api.nvim_buf_get_name(bufnr)
    if is_child_of_folder_containing('**/deno.json', buff_abs_path) then
      return {}
    elseif is_child_of_folder_containing('**/dprint.json', buff_abs_path) then
      return { 'dprint' }
    elseif is_child_of_folder_containing('**/.prettierrc', buff_abs_path) then
      return { 'prettier' }
    end
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
    config = function(_, opts)
      require('conform').setup(opts)
      vim.keymap.set('', '<leader>f', function()
        require('conform').format { async = true, lsp_fallback = true }
      end, { desc = 'Autoformat' })
    end,
  },
}
