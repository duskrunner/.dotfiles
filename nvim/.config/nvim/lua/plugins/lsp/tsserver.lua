local map = require('utils').map

map('n', '<leader>co', function()
  vim.lsp.buf.code_action {
    apply = true,
    context = {
      only = { 'source.organizeImports.ts' },
      diagnostics = {},
    },
  }
end, { desc = 'Organize Imports' })

map('n', '<leader>cR', function()
  vim.lsp.buf.code_action {
    apply = true,
    context = {
      only = { 'source.removeUnused.ts' },
      diagnostics = {},
    },
  }
end, { desc = 'Remove unused imports' })
return {
  ---@diagnostic disable-next-line: missing-fields
  settings = {
    completions = {
      completeFunctionCalls = true,
    },
  },
}
