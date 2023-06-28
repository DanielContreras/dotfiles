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
    formatting.cmake_format,
    formatting.beautysh,
    formatting.latexindent,
    formatting.prettier,
  },
})

