return {
  'nvim-pack/nvim-spectre',
  cmd = 'Spectre',
  opts = { open_cmd = 'noswapfile vnew' },
  keys = {
    {
      '<leader>cr',
      function()
        require('spectre').open()
      end,
      desc = '[C]ode [R]eplace',
    },
  },
}
