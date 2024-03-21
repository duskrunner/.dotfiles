vim.api.nvim_create_autocmd('User', {
  pattern = 'VeryLazy',
  callback = function()
    require 'config.keymaps'
    vim.api.nvim_create_user_command('LazyHealth', function()
      vim.cmd [[Lazy! load all]]
      vim.cmd [[checkhealth]]
    end, { desc = 'Load all plugins and run :checkhealth' })
  end,
})
