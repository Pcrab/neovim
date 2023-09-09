return {
	"nvim-neo-tree/neo-tree.nvim",
	branch = "v3.x",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
		"MunifTanjim/nui.nvim",
	},
	opts = {
		window = {
			position = "left",
		},
	},
	keys = {
		{ "<leader>tt", mode = { "n" }, "<cmd>Neotree toggle<cr>" },
		{ "<leader>tg", mode = { "n" }, "<cmd>Neotree source=git_status reveal=true toggle<cr>" },
		{ "<leader>tr", mode = { "n" }, "<cmd>Neotree reveal=true toggle<cr>" },
	},
}
