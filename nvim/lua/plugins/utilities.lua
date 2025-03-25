return {
	{
		"smoka7/hop.nvim",
		version = "*",
		opts = {
			keys = "etovxqpdygfblzhckisuran",
		},
		keys = {
			{ "<leader><leader>", "<cmd> HopWord <CR>", desc = "Hop into words" },
		},
	},
	{
		"folke/persistence.nvim",
		event = "BufReadPre", -- this will only start session saving when an actual file was opened
		opts = {
			-- add any custom options here
		},
	},
	{
		"folke/todo-comments.nvim",
		dependencies = { "nvim-lua/plenary.nvim" },
		opts = {
			-- your configuration comes here
			-- or leave it empty to use the default settings
			-- refer to the configuration section below
		},
		keys = {
			{
				"<leader>td",
				"<cmd> TodoTelescope <CR>",
				desc = "List TODOs",
			},
		},
	},
	{
		"alexghergh/nvim-tmux-navigation",
	},
}
