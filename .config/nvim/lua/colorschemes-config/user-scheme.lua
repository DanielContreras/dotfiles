-- Provide a default color scheme in the event that our desired scheme encounters and error
vim.cmd("colorscheme default")
local colorscheme = "tokyonight"

local status_ok, _ = pcall(vim.cmd, "colorscheme " .. colorscheme)
if not status_ok then
	vim.notify("colorscheme " .. colorscheme .. " not found!")
	return
end
