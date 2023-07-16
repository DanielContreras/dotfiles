return {
	"lukas-reineke/indent-blankline.nvim",
	lazy = true,
	opts = function()
		return require("plugins.configs.indent")
	end,
	config = function(_, opts)
		require("indent_blankline").setup(opts)
	end,
}
