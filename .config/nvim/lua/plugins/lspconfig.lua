return {
  "neovim/nvim-lspconfig",
  opts = {
    autoformat = true,
    format_notify = true,
  },
  config = function(_, opts)
    local Util = require("lazyvim.util")

    if Util.has("neoconf.nvim") then
      local plugin = require("lazy.core.config").spec.plugins["neoconf.nvim"]
      require("neoconf").setup(require("lazy.core.plugin").values(plugin, "opts", false))
    end
    -- setup autoformat
    require("lazyvim.plugins.lsp.format").setup(opts)
    -- setup formatting and keymaps
    Util.on_attach(function(client, buffer)
      require("lazyvim.plugins.lsp.keymaps").on_attach(client, buffer)
      -- require("navigator.lspclient.mapping").setup({ bufnr = buffer, client = client })
    end)

    local register_capability = vim.lsp.handlers["client/registerCapability"]

    vim.lsp.handlers["client/registerCapability"] = function(err, res, ctx)
      local ret = register_capability(err, res, ctx)
      local client_id = ctx.client_id
      ---@type lsp.Client
      local client = vim.lsp.get_client_by_id(client_id)
      local buffer = vim.api.nvim_get_current_buf()
      require("lazyvim.plugins.lsp.keymaps").on_attach(client, buffer)
      return ret
    end

    -- diagnostics
    for name, icon in pairs(require("lazyvim.config").icons.diagnostics) do
      name = "DiagnosticSign" .. name
      vim.fn.sign_define(name, { text = icon, texthl = name, numhl = "" })
    end

    local inlay_hint = vim.lsp.buf.inlay_hint or vim.lsp.inlay_hint

    if opts.inlay_hints.enabled and inlay_hint then
      Util.on_attach(function(client, buffer)
        if client.supports_method("textDocument/inlayHint") then
          inlay_hint(buffer, true)
        end
      end)
    end

    if type(opts.diagnostics.virtual_text) == "table" and opts.diagnostics.virtual_text.prefix == "icons" then
      opts.diagnostics.virtual_text.prefix = vim.fn.has("nvim-0.10.0") == 0 and "●"
        or function(diagnostic)
          local icons = require("lazyvim.config").icons.diagnostics
          for d, icon in pairs(icons) do
            if diagnostic.severity == vim.diagnostic.severity[d:upper()] then
              return icon
            end
          end
        end
    end

    vim.diagnostic.config(vim.deepcopy(opts.diagnostics))

    local servers = opts.servers
    local has_cmp, cmp_nvim_lsp = pcall(require, "cmp_nvim_lsp")
    local capabilities = vim.tbl_deep_extend(
      "force",
      {},
      vim.lsp.protocol.make_client_capabilities(),
      has_cmp and cmp_nvim_lsp.default_capabilities() or {},
      opts.capabilities or {}
    )

    local function pre_setup(server)
      local server_opts = vim.tbl_deep_extend("force", {
        capabilities = vim.deepcopy(capabilities),
      }, servers[server] or {})

      if opts.setup[server] then
        if opts.setup[server](server, server_opts) then
          return
        end
      elseif opts.setup["*"] then
        if opts.setup["*"](server, server_opts) then
          return
        end
      end
      require("lspconfig")[server].setup(server_opts)
    end

    local function setup(server)
      pre_setup(server)
      -- require("lsp_signature").setup({
      --   bind = true, -- This is mandatory, otherwise border config won't get registered.
      --   handler_opts = {
      --     border = "rounded",
      --     toggle_key = "C-x",
      --   },
      -- })
    end

    -- get all the servers that are available thourgh mason-lspconfig
    local have_mason, mlsp = pcall(require, "mason-lspconfig")
    local all_mslp_servers = {}
    if have_mason then
      all_mslp_servers = vim.tbl_keys(require("mason-lspconfig.mappings.server").lspconfig_to_package)
    end

    local ensure_installed = {} ---@type string[]
    for server, server_opts in pairs(servers) do
      if server_opts then
        server_opts = server_opts == true and {} or server_opts
        -- run manual setup if mason=false or if this is a server that cannot be installed with mason-lspconfig
        if server_opts.mason == false or not vim.tbl_contains(all_mslp_servers, server) then
          setup(server)
        else
          ensure_installed[#ensure_installed + 1] = server
        end
      end
    end

    if have_mason then
      mlsp.setup({ ensure_installed = ensure_installed, handlers = { setup } })
    end

    if Util.lsp_get_config("denols") and Util.lsp_get_config("tsserver") then
      local lsp_util = require("lspconfig.util")
      local function is_deno_2(root_dir)
        local is_deno_project = lsp_util.root_pattern("deno.json", "deno.jsonc")
        local is_vscode = lsp_util.root_pattern(".vscode/settings.json")

        local deno = is_deno_project(root_dir)
        if deno then
          return deno
        else
          local vscode = is_vscode(root_dir)
          if vscode then
            local settings = io.open(root_dir .. "/.vscode/settings.json", "r")
            local cfg = vim.json.decode(settings.read(settings, "*a"))
            if cfg and cfg["deno.enable"] then
              return vscode
            end
          end
        end
      end

      local is_deno = lsp_util.root_pattern("deno.json", "deno.jsonc")
      Util.lsp_disable("tsserver", is_deno_2)
      Util.lsp_disable("denols", function(root_dir)
        return not is_deno_2(root_dir)
      end)
    end
  end,
}