-- Autocommand that reloads and runs a PackerSync on save
vim.cmd([[
    augroup packer_user_config
        autocmd!
        autocmd BufWritePost init.lua source <afile> | PackerSync
    augroup end
]])

vim.cmd([[packadd packer.nvim]])
return require("packer").startup(function(use)
	-- Packer can manage itself
	use("wbthomason/packer.nvim")
	use({ "catppuccin/nvim", as = "catppuccin" })
	use("p00f/nvim-ts-rainbow") -- colorful delimeters
	use("tpope/vim-repeat") -- plugin support for . command
	use("ggandor/lightspeed.nvim") -- Motion plugin for better navigation
	use("p00f/clangd_extensions.nvim") -- clangd_extensions
	use("numToStr/Comment.nvim") -- Commenting plugin
	use("lukas-reineke/indent-blankline.nvim") -- indent lines
	use("kylechui/nvim-surround") -- vim surround
	use("lewis6991/gitsigns.nvim") -- git signs (seems to cause some errors)

	--> Autopairs
	use({
		"windwp/nvim-autopairs",
		config = function()
			require("nvim-autopairs").setup({})
		end,
	})

	--> Telescope
	use({
		"nvim-telescope/telescope.nvim",
		tag = "0.1.1",
		-- or                            , branch = '0.1.x',
		requires = { { "nvim-lua/plenary.nvim" } },
	})
	-- Faster zfz finding with telescope
	use({
		"nvim-telescope/telescope-fzf-native.nvim",
		run = "cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build",
	})

	--> nvim-tree
	use({
		"nvim-tree/nvim-tree.lua",
		requires = {
			"nvim-tree/nvim-web-devicons", -- optional
		},
	})

	--> lualine
	use({
		"nvim-lualine/lualine.nvim",
		requires = { "nvim-tree/nvim-web-devicons", opt = true },
	})

	--> Treesitter
	use({ "nvim-treesitter/nvim-treesitter", { run = ":TSUpdate" } })
	use({
		"nvim-treesitter/nvim-treesitter-textobjects",
		after = "nvim-treesitter",
		requires = "nvim-treesitter/nvim-treesitter",
	})
	use("nvim-treesitter/nvim-treesitter-refactor")

	--> LSP
	use({
		"VonHeikemen/lsp-zero.nvim",
		branch = "v2.x",
		requires = {
			-- LSP Support
			{ "neovim/nvim-lspconfig" }, -- Required
			{ -- Optional
				"williamboman/mason.nvim",
				run = function()
					pcall(vim.cmd, "MasonUpdate")
				end,
			},
			{ "williamboman/mason-lspconfig.nvim" }, -- Optional

			-- Autocompletion
			{ "hrsh7th/nvim-cmp" }, -- Required
			{ "hrsh7th/cmp-nvim-lsp" }, -- Required
			{ "L3MON4D3/LuaSnip" }, -- Required
			{ "hrsh7th/cmp-buffer" }, -- Autocompletion plugin
			{ "hrsh7th/cmp-path" }, -- Autocompletion plugin for paths
			{ "hrsh7th/cmp-nvim-lua" }, -- Autocompletion plugin for Lua
			{ "hrsh7th/cmp-cmdline" }, -- Autocompletion plugin
		},
	})
	use("onsails/lspkind.nvim") -- inject lsp diagnostics, formatting, code actions
	use("jose-elias-alvarez/null-ls.nvim") -- diagnostics, formatting, code actions, etc
end)
