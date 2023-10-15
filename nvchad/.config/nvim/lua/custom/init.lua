local opts = { noremap = true, silent = true }
local function quickfix()
	vim.lsp.buf.code_action({
		apply = true,
	})
end

local enable_providers = {
	"python3_provider",
}

for _, plugin in pairs(enable_providers) do
	vim.g["loaded_" .. plugin] = nil
	vim.cmd("runtime " .. plugin)
end

vim.keymap.set("n", "<leader>qf", quickfix, opts)
