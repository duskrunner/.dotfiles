-- TODO: think about lazyloading only scheme used in current-colorscheme.lua
local colorschemes = {
  {
    'folke/tokyonight.nvim',
    lazy = false,
    priority = 1000,
    config = function()
      vim.cmd.hi 'Comment gui=none'
    end,
  },
  { 'samharju/synthweave.nvim', lazy = false, priority = 1000 },
  { 'tiagovla/tokyodark.nvim', lazy = false, priority = 1000 },
}

return colorschemes
