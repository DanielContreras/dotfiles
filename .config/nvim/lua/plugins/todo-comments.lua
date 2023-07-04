return {
	"folke/todo-comments.nvim",
	cmd = { "TodoLocList", "TodoQuickfix", "TodoTelescope", "TodoTrouble" },
	event = "InsertEnter",
	-- event = "VeryLazy",
	dependencies = { "nvim-lua/plenary.nvim" },
	opts = {
		-- your configuration comes here
		-- or leave it empty to use the default settings
		-- refer to the configuration section below
	},
}
