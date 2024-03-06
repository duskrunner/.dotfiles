-- TODO: think about lazyloading only scheme used in current-colorscheme.lua
return {
  {
    'folke/tokyonight.nvim',
    lazy = false,
    priority = 1000,
    config = function()
      vim.cmd.hi 'Comment gui=none'
    end,
  },
}
