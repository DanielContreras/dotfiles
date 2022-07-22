local set = vim.opt

vim.notify = require("notify")

set.expandtab = true -- convert tabs to spaces
set.smarttab = true --
set.shiftwidth = 2 -- the number of spaces inserted for each indentation
set.tabstop = 2 -- the number of spaces for a tab

set.hlsearch = true -- highlight all matches on previous search pattern
set.incsearch = true -- incrementally jump to item being searched
set.ignorecase = true -- ignores case when searching
set.smartcase = true -- yes

set.splitbelow = true -- force a horizontal split to go below
set.splitright = true -- force a vertical split to go to the right
set.wrap = true -- turn of code wrapping
set.scrolloff = 8 -- yes
set.fileencoding = "utf-8" -- file encoding
set.termguicolors = true -- provide full color support for terminals that support it

set.number = true -- shows row number on the side
set.relativenumber = true -- sets the lines above and below relative to current
set.autoindent = true -- auto indent
set.mouse = "a" -- turns on mouse suport
set.syntax = "on" -- turns on basic syntax highlighting
set.backspace = "indent,eol,start" -- backspace works as expected
set.fileformat = unix -- yes
set.completeopt = "menuone,noselect" -- cmp stuff

set.cursorline = true -- sets cursorline to highlight current line

set.updatetime = 300 -- faster completion (4000ms default)

set.hidden = true -- yes

vim.cmd([[set iskeyword+=-]]) -- treats - as a keyword, so if you dw select-all, it'll delete the entire word

vim.laststatus = 3 -- Set global statusline
