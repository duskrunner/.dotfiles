local M = {}
M.vim_tmux = {
	n = {
		["<C-h>"] = { "<cmd> TmuxNavigateLeft<CR>", "window left" },
		["<C-l>"] = { "<cmd> TmuxNavigateRight<CR>", "window right" },
		["<C-j>"] = { "<cmd> TmuxNavigateDown<CR>", "window down" },
		["<C-k>"] = { "<cmd> TmuxNavigateUp<CR>", "window up" },
	},
}

M.move_line = {
	n = {
		["<A-j>"] = { "ddp", "Move line down" },
		["<A-k>"] = { "ddhP", "Move line up" },
	},
}
M.telescope = {
	n = {
		["<leader>fg"] = {
			":lua require('telesope').extentions.live_grep_args.live_grep_args()<CR>",
			"Live grep with args",
		},
	},
}

M.dap = {
	plugin = true,
	n = {
		["<leader>db"] = {
			"<cmd> DapToggleBreakpoint <CR>",
			"Add breakpoint at line",
		},
		["<leader>dr"] = {
			"<cmd> DapContinue <CR>",
			"Start or continue the debugger",
		},
	},
}

return M
