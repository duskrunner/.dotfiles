local plugins = {
  {
    "chistoomey/vim-tmux-navigator",
    lasy = false,
  },
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      "jose-elias-alvarez/null-ls.nvim",
      config = function()
        require "custom.configs.null-ls"
      end,
    },
    config = function()
      require "plugins.configs.lspconfig"
      require "custom.configs.lspconfig"
      require "custom.configs.null-ls"
    end,
  },
}

return plugins
