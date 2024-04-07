return {
  'nvim-treesitter/nvim-treesitter-context',
  event = { 'BufReadPost', 'BufNewFile', 'BufWritePre' },
  enabled = true,
  opts = { mode = 'cursor', max_lines = 3 },
  keys = {
    {
      '<leader>ut',
      function()
        local Util = require 'utils'
        local tsc = require 'treesitter-context'
        tsc.toggle()
        if Util.get_upvalue(tsc.toggle, 'enabled') then
          vim.notify('Enabled Treesitter Context', vim.log.levels.INFO)
        else
          vim.notify('Disabled Treesitter Context', vim.log.levels.WARN)
        end
      end,
      desc = 'Toggle Treesitter Context',
    },
  },
}
