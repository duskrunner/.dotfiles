local map = require('utils').map

map('n', '<leader>co', function()
  vim.lsp.buf.code_action {
    apply = true,
    context = {
      only = { 'source.organizeImports' },
      diagnostics = {},
    },
  }
end, { desc = 'Organize Imports' })

return {}
