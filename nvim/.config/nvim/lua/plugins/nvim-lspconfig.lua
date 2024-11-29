local map = require('utils').map
local icons = require 'config.icons'

return {
  'neovim/nvim-lspconfig',
  dependencies = {
    'williamboman/mason.nvim',
    'williamboman/mason-lspconfig.nvim',
    'WhoIsSethDaniel/mason-tool-installer.nvim',
    { 'j-hui/fidget.nvim', opts = {} },
  },
  config = function()
    vim.api.nvim_create_autocmd('LspAttach', {
      group = vim.api.nvim_create_augroup('lsp-attach', { clear = true }),
      callback = function(event)
        map('n', 'gd', require('telescope.builtin').lsp_definitions, { desc = '[G]oto [D]efinition' })
        map('n', 'gr', require('telescope.builtin').lsp_references, { desc = '[G]oto [R]eferences' })
        map('n', 'gI', require('telescope.builtin').lsp_implementations, { desc = '[G]oto [I]mplementation' })
        map('n', '<leader>D', require('telescope.builtin').lsp_type_definitions, { desc = 'Type [D]efinition' })
        map('n', '<leader>ds', require('telescope.builtin').lsp_document_symbols, { desc = '[D]ocument [S]ymbols' })
        map('n', '<leader>ws', require('telescope.builtin').lsp_dynamic_workspace_symbols, { desc = '[W]orkspace [S]ymbols' })
        map('n', '<leader>rn', vim.lsp.buf.rename, { desc = '[R]e[n]ame' })
        map('n', '<leader>ca', vim.lsp.buf.code_action, { desc = '[C]ode [A]ction' })
        map('n', 'K', vim.lsp.buf.hover, { desc = 'Hover Documentation' })
        map('n', 'gD', vim.lsp.buf.declaration, { desc = '[G]oto [D]eclaration' })
        local client = vim.lsp.get_client_by_id(event.data.client_id)
        if client and client.server_capabilities.documentHighlightProvider then
          vim.api.nvim_create_autocmd({ 'CursorHold', 'CursorHoldI' }, {
            buffer = event.buf,
            callback = vim.lsp.buf.document_highlight,
          })

          vim.api.nvim_create_autocmd({ 'CursorMoved', 'CursorMovedI' }, {
            buffer = event.buf,
            callback = vim.lsp.buf.clear_references,
          })
        end
      end,
    })

    local capabilities = vim.lsp.protocol.make_client_capabilities()
    capabilities = vim.tbl_deep_extend('force', capabilities, require('cmp_nvim_lsp').default_capabilities())

    local servers = {
      -- NOTE: Temp LSPs for work
      -- yamlls = {
      --   settings = {
      --     yaml = {
      --       schemas = {
      --         ['https://raw.githubusercontent.com/microsoft/azure-pipelines-vscode/master/service-schema.json'] = {
      --           '.build/pipelines/**/*.y*l',
      --         },
      --       },
      --     },
      --   },
      -- },

      -- Yaml
      yamlls = require 'plugins.lsp.yamlls',
      -- Ansible
      ansiblels = {},
      --HTML
      html = {},
      -- TS/JS
      ts_ls = require 'plugins.lsp.tsserver',
      eslint = {},
      -- Bash
      bashls = {},
      -- Python
      ruff = require 'plugins.lsp.ruff',
      pyright = {},
      -- Markdown,
      marksman = {},
      -- Lua
      lua_ls = require 'plugins.lsp.lua_ls',
      -- Go
      gopls = require 'plugins.lsp.gopls',
      -- Docker
      dockerls = {},
      docker_compose_language_service = {},
    }

    require('mason').setup {
      ui = { icons = icons.mason },
    }
    local ensure_installed = vim.tbl_keys(servers or {})
    local ls_mapper = { harper_ls = 'harper-ls' }
    for i, ls in ipairs(ensure_installed) do
      if ls_mapper[ls] then
        ensure_installed[i] = ls_mapper[ls]
      end
    end
    local formatters = require('plugins.conform').opts().formatters_by_ft
    local linters = require('plugins.nvim-lint').opts.linters_by_ft
    local mapper = { python = { 'ruff' } }
    for lang, f in pairs(formatters) do
      if mapper[lang] then
        f = mapper[lang]
      end
      vim.list_extend(ensure_installed, f)
    end
    for _, l in pairs(linters) do
      vim.list_extend(ensure_installed, l)
    end

    vim.list_extend(ensure_installed, { 'delve', 'debugpy' })
    require('mason-tool-installer').setup { ensure_installed = ensure_installed }

    require('mason-lspconfig').setup {
      handlers = {
        function(server_name)
          local server = servers[server_name] or {}
          server.capabilities = vim.tbl_deep_extend('force', {}, capabilities, server.capabilities or {})
          require('lspconfig')[server_name].setup(server)
        end,
      },
    }
  end,
}
