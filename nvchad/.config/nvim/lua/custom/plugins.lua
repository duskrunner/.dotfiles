local plugins = {
	{
		"williamboman/mason.nvim",
		opts = {
			ensure_installed = {
				"dockerfile-language-server",
				"eslint_d",
				"lua-language-server",
				"prettierd",
				"typescript-language-server",
				"clangd",
				"clang-format",
				"gopls",
				"gofumpt",
				"goimports-reviser",
				"golines",
				"rust-analyzer",
				"rustfmt",
				"stylua",
			},
		},
	},
	{
		"nvim-treesitter/nvim-treesitter",
		opts = {
			ensure_installed = {
				"html",
				"css",
				"bash",
				"javascript",
				"typescript",
				"rust",
				"go",
				"query",
				"tsx",
				"vim",
				"vimdoc",
				"lua",
				"c",
				"cpp",
				"dockerfile",
				"yaml",
			},
		},
	},
	{
		"neovim/nvim-lspconfig",
		dependencies = {
			"jose-elias-alvarez/null-ls.nvim",
			config = function()
				require("custom.configs.null-ls")
			end,
		},
		config = function()
			require("plugins.configs.lspconfig")
			require("custom.configs.lspconfig")
			require("custom.configs.null-ls")
		end,
	},
}

return plugins
