local map = require('utils').map

map('n', '<leader>co', function()
  vim.lsp.buf.code_action {
    apply = true,
    context = {
      only = { 'source.organizeImports.ts' },
      diagnostics = {},
    },
  }
  map('n', '<leader>cR', function()
    vim.lsp.buf.code_action {
      apply = true,
      context = {
        only = { 'source.removeUnused.ts' },
        diagnostics = {},
      },
    }
  end, { desc = 'Remove unused imports' })
end, { desc = 'Organize Imports' })
return {
  ---@diagnostic disable-next-line: missing-fields
  settings = {
    completions = {
      completeFunctionCalls = true,
    },
  },
}
