local map = require('utils').map
local ls = require 'luasnip'

map('n', '<Esc>', '<cmd>nohlsearch<CR>')
map('n', '[d', vim.diagnostic.goto_prev, { desc = 'Go to previous [D]iagnostic message' })
map('n', ']d', vim.diagnostic.goto_next, { desc = 'Go to next [D]iagnostic message' })
map('n', '<leader>e', vim.diagnostic.open_float, { desc = 'Show diagnostic [E]rror messages' })
map('n', '<leader>o', vim.diagnostic.setloclist, { desc = 'Open diagnostic [Q]uickfix list' })
map('t', '<Esc><Esc>', '<C-\\><C-n>', { desc = 'Exit terminal mode' })
map('n', '<C-h>', '<C-w><C-h>', { desc = 'Move focus to the left window' })
map('n', '<C-l>', '<C-w><C-l>', { desc = 'Move focus to the right window' })
map('n', '<C-j>', '<C-w><C-j>', { desc = 'Move focus to the lower window' })
map('n', '<C-k>', '<C-w><C-k>', { desc = 'Move focus to the upper window' })
map({ 'i', 'x', 'n', 's' }, '<C-s>', '<cmd>w<cr><esc>', { desc = 'Save file' })
map({ 'i', 's' }, '<Tab>', function()
  if ls.expand_or_locally_jumpable() then
    ls.expand_or_jump()
  end
end, { desc = 'luasnip jump next' })
map({ 'i', 's' }, '<S-Tab>', function()
  if ls.locally_jumpable(-1) then
    ls.jump(-1)
  end
end, { desc = 'luasnip jump previous' })
