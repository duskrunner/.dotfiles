return {
  'stevearc/conform.nvim',
  dependencies = { 'mason.nvim' },
  opts = function()
    local formatters = require 'conform.formatters'
    formatters.yamlfmt.args = vim.list_extend({ '-conf', vim.fs.find('.yamlfmt.yml', { upward = true })[1] }, formatters.yamlfmt.args)

    ---@class ConformOpts
    local opts = {
      notify_on_error = false,
      format_on_save = {
        timeout_ms = 500,
        lsp_fallback = true,
      },
      format = {
        timeout_ms = 3000,
        async = false, -- not recommended to change
        quiet = false, -- not recommended to change
        lsp_fallback = true, -- not recommended to change
      },
      formatters_by_ft = {
        lua = { 'stylua' },
        sh = { 'shfmt' },
        javascript = { 'prettierd' },
        typescript = { 'prettierd' },
        javascriptreact = { 'prettierd' },
        typescriptreact = { 'prettierd' },
        html = { 'prettierd' },
        json = { 'prettierd' },
        css = { 'prettierd' },
        -- python = { 'ruff_fix', 'ruff_format' },
        markdown = { 'mdformat' },
        yaml = { 'yamlfmt' },
        go = { 'goimports', 'gofumpt' },
      },
      formatters = {
        injected = { options = { ignore_errors = true } },
      },
    }
    return opts
  end,
}
