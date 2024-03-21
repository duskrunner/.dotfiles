return {
  'akinsho/toggleterm.nvim',
  config = true,
  lazy = false,
  init = function()
    local Terminal = require('toggleterm.terminal').Terminal
    local lazygit = Terminal:new { cmd = 'lazygit', hidden = true, direction = 'float' }
    local lazydocker = Terminal:new { cmd = 'lazydocker', hidden = true, direction = 'float' }

    function Lazygit_toggle()
      lazygit:toggle()
    end

    function Lazydocker_toggle()
      lazydocker:toggle()
    end

    vim.api.nvim_set_keymap('n', '<A-g>', '<cmd>lua Lazygit_toggle()<CR>', { noremap = true, silent = true })
    vim.api.nvim_set_keymap('n', '<A-d>', '<cmd>lua Lazydocker_toggle()<CR>', { noremap = true, silent = true })
  end,
}
