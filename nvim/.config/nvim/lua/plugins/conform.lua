local prefer_bin_from_venv = require('utils.init').prefer_bin_from_venv

return {
  'stevearc/conform.nvim',
  dependencies = { 'mason.nvim' },
  opts = function()
    -- local formatters = require 'conform.formatters'
    -- formatters.ruff_fix.command = prefer_bin_from_venv 'ruff'
    -- formatters.ruff_format.command = prefer_bin_from_venv 'ruff'
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
        python = { 'ruff_fix', 'ruff_format' },
      },
      formatters = {
        injected = { options = { ignore_errors = true } },
      },
    }
    return opts
  end,
}
