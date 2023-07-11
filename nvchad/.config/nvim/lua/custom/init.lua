local opts = { noremap = true, silent = true }
local function quickfix()
	vim.lsp.buf.code_action({
		apply = true,
	})
end

vim.keymap.set("n", "<leader>qf", quickfix, opts)
