-- Provide a default color scheme in the event that our desired scheme encounters and error
vim.cmd("colorscheme default")
local colorscheme = "tokyonight"

vim.g.tokyonight_style = "storm"
vim.g.tokyonight_italic_comments = false
vim.g.tokyonight_italic_keywords = false

local status_ok, _ = pcall(vim.cmd, "colorscheme " .. colorscheme)
if not status_ok then
	vim.notify("colorscheme " .. colorscheme .. " not found!")
	return
end
