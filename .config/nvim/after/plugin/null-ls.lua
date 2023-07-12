local augroup = vim.api.nvim_create_augroup("LspFormatting", {})
local null_ls_status_ok, null_ls = pcall(require, "null-ls")
if not null_ls_status_ok then
	return
end

local formatting = null_ls.builtins.formatting

null_ls.setup({
	sources = {
		null_ls.builtins.code_actions.gitsigns,
		formatting.eslint,
		formatting.autopep8,
		formatting.stylua,
		formatting.beautysh,
		formatting.latexindent,
		formatting.prettier,
		formatting.clang_format,
	},
	on_attach = function(client, bufnr)
		if client.supports_method("textDocument/formatting") then
			vim.api.nvim_clear_autocmds({
				group = augroup,
				buffer = bufnr,
			})
			vim.api.nvim_create_autocmd("BufWritePre", {
				group = augroup,
				buffer = bufnr,
				callback = function()
					vim.lsp.buf.format({ bufnr = bufnr })
				end,
			})
		end
	end,
})
