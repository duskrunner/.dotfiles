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

vim.api.nvim_create_autocmd('VimEnter', {
  desc = 'Set colorscheme',
  callback = function()
    vim.diagnostic.config {
      signs = {
        text = {
          [vim.diagnostic.severity.ERROR] = ' ',
          [vim.diagnostic.severity.WARN] = ' ',
          [vim.diagnostic.severity.INFO] = ' ',
          [vim.diagnostic.severity.HINT] = '󰌵',
        },
      },
    }
    require 'config.current-colorscheme'
  end,
})

vim.api.nvim_create_autocmd('TextYankPost', {
  desc = 'Highlight when yanking (copying) text',
  group = vim.api.nvim_create_augroup('highlight-yank', { clear = true }),
  callback = function()
    vim.highlight.on_yank()
  end,
})
