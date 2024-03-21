vim.g.mapleader = ' '
vim.g.maplocalleader = ' '
vim.g.guibg = nil
vim.opt.number = true
vim.opt.mouse = 'a'
vim.opt.showmode = false
vim.opt.clipboard = 'unnamedplus'
vim.opt.breakindent = true
vim.opt.undofile = true
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.signcolumn = 'yes'
vim.opt.updatetime = 250
vim.opt.timeoutlen = 300
vim.opt.splitright = true
vim.opt.splitbelow = true
vim.opt.list = true
vim.opt.listchars = { tab = '» ', trail = '·', nbsp = '␣' }
vim.opt.inccommand = 'split'
vim.opt.cursorline = true
vim.opt.scrolloff = 10
vim.opt.hlsearch = true
vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>')
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, { desc = 'Go to previous [D]iagnostic message' })
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, { desc = 'Go to next [D]iagnostic message' })
vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float, { desc = 'Show diagnostic [E]rror messages' })
vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostic [Q]uickfix list' })
vim.keymap.set('t', '<Esc><Esc>', '<C-\\><C-n>', { desc = 'Exit terminal mode' })
vim.keymap.set('n', '<C-h>', '<C-w><C-h>', { desc = 'Move focus to the left window' })
vim.keymap.set('n', '<C-l>', '<C-w><C-l>', { desc = 'Move focus to the right window' })
vim.keymap.set('n', '<C-j>', '<C-w><C-j>', { desc = 'Move focus to the lower window' })
vim.keymap.set('n', '<C-k>', '<C-w><C-k>', { desc = 'Move focus to the upper window' })

require 'config.autocommands'
vim.api.nvim_create_autocmd('TextYankPost', {
  desc = 'Highlight when yanking (copying) text',
  group = vim.api.nvim_create_augroup('kickstart-highlight-yank', { clear = true }),
  callback = function()
    vim.highlight.on_yank()
  end,
})

-- NOTE: Init lazy or install if not installed
local lazypath = vim.fn.stdpath 'data' .. '/lazy/lazy.nvim'
if not vim.loop.fs_stat(lazypath) then
  local lazyrepo = 'https://github.com/folke/lazy.nvim.git'
  vim.fn.system { 'git', 'clone', '--filter=blob:none', '--branch=stable', lazyrepo, lazypath }
end
vim.opt.rtp:prepend(lazypath)

require 'config'

require('lazy').setup {
  require 'plugins.nvim-lspconfig',
  'tpope/vim-sleuth',
  require 'plugins.persistence',
  require 'plugins.dashboard-nvim',
  require 'plugins.dressing',
  require 'plugins.noice',
  require 'plugins.bufferline',
  require 'plugins.lualine',
  require 'plugins.nvim-spectre',
  require 'plugins.indent-blankline',
  require 'plugins.mini.indentscope',
  require 'plugins.neo-tree',
  require 'plugins.flash',
  require 'plugins.which-key',
  require 'plugins.gitsigns',
  require 'plugins.telescope',
  require 'plugins.vim-illuminate',
  require 'plugins.trouble',
  require 'plugins.todo-comments',
  require 'plugins.vim-startuptime',
  require 'plugins.nvim-lint',
  require 'plugins.mini.pairs',
  require 'plugins.mini.surround',
  require 'plugins.Comment_nvim',
  require 'plugins.conform',
  require 'plugins.LuaSnip',
  require 'plugins.nvim-treesitter',
  require 'plugins.nvim-treesitter-context',
  require 'plugins.diffview',
  require 'plugins.doge',
  require 'plugins.nvim-ts-autotag',
  require 'plugins.nvim-cmp',
  require 'plugins.toggleterm',
  unpack(require 'config.colorschemes'),
}
