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
				"codelldb",
				"gopls",
				"gofumpt",
				"goimports-reviser",
				"golines",
				"rust-analyzer",
				"rustfmt",
				"stylua",
				"pyright",
				"mypy",
				"ruff",
				"black",
				"debugpy",
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
				"python",
			},
		},
	},
	{ "Bekaboo/dropbar.nvim", lazy = false },
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
		"rcarriga/nvim-dap-ui",
		event = "VeryLazy",
		dependencies = "mfussenegger/nvim-dap",
		config = function()
			local dap = require("dap")
			local dapui = require("dapui")
			dapui.setup()
			dap.listeners.after.event_initialized["dapui_config"] = function()
				dapui.open()
			end
			dap.listeners.before.event_terminated["dapui_config"] = function()
				dapui.close()
			end
			dap.listeners.before.event_exited["dapui_config"] = function()
				dapui.close()
			end
		end,
	},
	{
		"jay-babu/mason-nvim-dap.nvim",
		event = "VeryLazy",
		dependencies = {
			"williamboman/mason.nvim",
			"mfussenegger/nvim-dap",
		},
		opts = {
			handlers = {},
		},
	},
	{
		"mfussenegger/nvim-dap",
		config = function(_, _)
			require("core.utils").load_mappings("dap")
		end,
	},
	{

		"mfussenegger/nvim-dap-python",
		ft = "python",
		dependencies = {
			"mfussenegger/nvim-dap",
		},
		config = function(_, opts)
			local path = "~/.local/share/nvim/mason/packages/debugpy/venv/bin/python"
			require("dap-python").setup(path)
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
			local lazydocker = Terminal:new({ cmd = "lazydocker", hidden = true, direction = "float" })

			function _lazygit_toggle()
				lazygit:toggle()
			end

			function _lazydocker_toggle()
				lazydocker:toggle()
			end

			vim.api.nvim_set_keymap("n", "<A-g>", "<cmd>lua _lazygit_toggle()<CR>", { noremap = true, silent = true })
			vim.api.nvim_set_keymap(
				"n",
				"<leader>ld",
				"<cmd>lua _lazydocker_toggle()<CR>",
				{ noremap = true, silent = true }
			)
		end,
	},
	{ "christoomey/vim-tmux-navigator", lazy = false },
	{
		"nvim-telescope/telescope.nvim",
		dependencies = {
			"nvim-telescope/telescope-live-grep-args.nvim",
		},
		opts = {
			pickers = {
				find_files = {
					hidden = true,
				},
				live_grep = {
					additional_args = { "--hidden" },
				},
				find_string = {
					additional_args = { "--hidden" },
				},
			},
			config = function()
				require("telescope").load_extension("live_grep_args")
			end,
		},
	},
	{
		"nvim-tree/nvim-tree.lua",
		opts = {
			hijack_cursor = true,
			sync_root_with_cwd = true,
			git = { enable = true, ignore = false },
			renderer = {
				highlight_git = true,
				full_name = true,
				group_empty = true,
				special_files = {},
				symlink_destination = false,
				indent_markers = {
					enable = true,
				},
				icons = {
					git_placement = "after",
					show = {
						file = true,
						folder = true,
						folder_arrow = false,
						git = true,
					},
				},
			},
			update_focused_file = {
				enable = true,
				update_root = true,
				ignore_list = { "help" },
			},
			diagnostics = {
				enable = true,
				show_on_dirs = true,
			},
			actions = {
				change_dir = {
					enable = false,
					restrict_above_cwd = true,
				},
				open_file = {
					resize_window = true,
				},
				remove_file = {
					close_window = false,
				},
			},
		},
	},
}

return plugins
