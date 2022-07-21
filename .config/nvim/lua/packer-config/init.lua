-- Autocommand that reloads and runs a sync on all the packages on save
vim.cmd([[
    augroup packer_user_config
        autocmd!
        autocmd BufWritePost init.lua source <afile> | PackerSync
    augroup end
]])

return require("packer").startup(function()
	use("wbthomason/packer.nvim") -- have packer manage itself
	use("nvim-lua/popup.nvim") -- dependancy for something?
	use("EdenEast/nightfox.nvim") -- color theme
	use("kyazdani42/nvim-web-devicons") -- icons
	use("kyazdani42/nvim-tree.lua") -- folder tree
	use("nvim-lualine/lualine.nvim") -- status line
	use("windwp/nvim-autopairs") -- Auto match paranthesis, qutotations, etc
	use("numToStr/Comment.nvim") -- Commenting plugin
	use("rcarriga/nvim-notify") -- fancy notifications
	use("romgrk/barbar.nvim") -- Add buffers to the top of the editor
	use("nvim-lua/plenary.nvim") -- telescope dependancy
	use("fladson/vim-kitty") -- kitty syntax highlighting
	use("lukas-reineke/indent-blankline.nvim") -- Visual indentation markers
	use("akinsho/toggleterm.nvim") -- toggle terminal inside nvim session
	-- use("embear/vim-uncrustify")

	--> telescope plugins
	use("nvim-telescope/telescope.nvim") -- Find, Filter, Preview, Pick

	--> LSP plugins
	use("neovim/nvim-lspconfig") -- enables lsp
	use("williamboman/nvim-lsp-installer") -- Allows for easy installation of lsp servers
	use("hrsh7th/nvim-cmp") -- Autocompletion plugin
	use("hrsh7th/cmp-buffer") -- Autocompletion plugin
	use("hrsh7th/cmp-path") -- Autocompletion plugin for paths
	use("hrsh7th/cmp-nvim-lua") -- Autocompletion plugin for Lua
	use("hrsh7th/cmp-cmdline") -- Autocompletion plugin
	use("hrsh7th/cmp-nvim-lsp") -- LSP source for nvim-cmp
	use("saadparwaiz1/cmp_luasnip") -- Snippets source for nvim-cmp
	use("L3MON4D3/LuaSnip") -- Snippets plugin
	use("onsails/lspkind.nvim") -- inject lsp diagnostics, formatting, code actions
	use("jose-elias-alvarez/null-ls.nvim") -- diagnostics, formatting, code actions, etc

	--> treesitter & treesitter modules
	use({ "nvim-treesitter/nvim-treesitter", run = ":TSUpdate" })
	use("nvim-treesitter/nvim-treesitter-refactor")
	use("nvim-treesitter/nvim-treesitter-textobjects") -- Need to set up
	use("p00f/nvim-ts-rainbow")

	--> Latex plugins
	-- vimtex slow startup
	use("lervag/vimtex") -- syntax plugin for latex files

	--> Markdown plugins
	use("vimwiki/vimwiki") -- markdown stuff
	use({
		"iamcco/markdown-preview.nvim",
		run = "cd app && npm install",
		setup = function()
			vim.g.mkdp_filetypes = { "markdown" }
		end,
		ft = { "markdown" },
	})
end)
