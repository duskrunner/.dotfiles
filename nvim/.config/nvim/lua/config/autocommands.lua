vim.api.nvim_create_autocmd('VimEnter', {
  desc = 'Set colorscheme',
  callback = function()
    require 'config.current-colorscheme'
  end,
})
