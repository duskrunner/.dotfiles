local null_ls = require("null-ls")
local augroup = vim.api.nvim_create_augroup("LspFormatting", {})

local formatting = null_ls.builtins.formatting
local lint = null_ls.builtins.diagnostics

local sources = {
	formatting.prettierd,
	formatting.stylua,
	formatting.gofumpt,
	formatting.goimports_reviser,
	formatting.golines,
	formatting.clang_format,
	formatting.rustfmt,
	formatting.stylua,
	formatting.black,
	lint.shellcheck,
	lint.eslint_d,
	lint.ruff,
	lint.mypy,
}

null_ls.setup({
	debug = true,
	sources = sources,
	on_attach = function(client, bufnr)
		if client.supports_method("textDocument/formatting") then
			vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
			vim.api.nvim_create_autocmd("BufWritePre", {
				group = augroup,
				buffer = bufnr,
				callback = function()
					vim.lsp.buf.format({ async = false })
				end,
			})
		end
	end,
})
