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
		-- formatting.clang_format,
		formatting.beautysh,
		formatting.latexindent,
	},
	-- on_attach = function(client, bufnr)
	-- 	if client.supports_method("textDocument/formatting") then
	-- 		vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
	-- 		vim.api.nvim_create_autocmd("BufWritePre", {
	-- 			group = augroup,
	-- 			buffer = bufnr,
	-- 			callback = function()
	-- 				-- on 0.8, you should use vim.lsp.buf.format({ bufnr = bufnr }) instead
	-- 				vim.lsp.buf.formatting_sync()
	-- 			end,
	-- 		})
	-- 	end
	-- end,
})
