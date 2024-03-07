local map = require('utils').map

return {
  'lewis6991/gitsigns.nvim',
  event = { 'BufReadPost', 'BufNewFile', 'BufWritePre' },
  opts = {
    signs = {
      add = { text = '▎' },
      change = { text = '▎' },
      delete = { text = '' },
      topdelete = { text = '' },
      changedelete = { text = '▎' },
      untracked = { text = '▎' },
    },
    on_attach = function()
      local gs = package.loaded.gitsigns

      map('n', ']h', gs.next_hunk, { desc = 'Next [H]unk' })
      map('n', '[h', gs.prev_hunk, { desc = 'Prev [H]unk' })
      map({ 'n', 'v' }, '<leader>ghs', ':Gitsigns stage_hunk<CR>', { desc = '[G]it [S]tage [H]unk' })
      map({ 'n', 'v' }, '<leader>ghr', ':Gitsigns reset_hunk<CR>', { desc = '[G]it [R]eset [H]unk' })
      map('n', '<leader>ghS', gs.stage_buffer, { desc = '[G]it [S]tage [B]uffer' })
      map('n', '<leader>ghu', gs.undo_stage_hunk, { desc = '[G]it [U]ndo Stage [H]unk' })
      map('n', '<leader>gbR', gs.reset_buffer, { desc = '[G]it [R]eset [B]uffer' })
      map('n', '<leader>ghp', gs.preview_hunk_inline, { desc = '[G]it Preview [H]unk [I]nline' })
      map('n', '<leader>gbl', function()
        gs.blame_line { full = true }
      end, { desc = '[G]it [B]lame [L]ine' })
      map('n', '<leader>ghd', gs.diffthis, { desc = '[G]it [D]iff This' })
      map('n', '<leader>ghD', function()
        gs.diffthis '~'
      end, { desc = '[D]iff This ~' })
      map({ 'o', 'x' }, 'ih', ':<C-U>Gitsigns select_hunk<CR>', { desc = 'GitSigns Select Hunk' })
    end,
  },
}
