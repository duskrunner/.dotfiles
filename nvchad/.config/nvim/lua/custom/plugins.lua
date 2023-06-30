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
	{
		"akinsho/toggleterm.nvim",
		version = "*",
		config = true,
		lazy = false,
		init = function()
			local Terminal = require("toggleterm.terminal").Terminal
			local lazygit = Terminal:new({ cmd = "lazygit", hidden = true, direction = "float" })

			function _lazygit_toggle()
				lazygit:toggle()
			end

			vim.api.nvim_set_keymap("n", "<A-g>", "<cmd>lua _lazygit_toggle()<CR>", { noremap = true, silent = true })
		end,
	},
	{ "christoomey/vim-tmux-navigator", lazy = false },
}

return plugins
