local plugins = {
  {
    "christoomey/vim-tmux-navigator",
    lasy = false,
  },
  {
    "williamboman/mason.nvim",
    opts = {
      ensure_installed = {
      "dockerfile-language-server",
      "eslint-lsp",
      "eslint_d",
      "lua-language-server",
      "prettierd",
      "typescript-language-server",
      }
    }
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
