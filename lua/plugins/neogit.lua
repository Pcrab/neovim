return {
	"NeogitOrg/neogit",
	dependencies = {
		{ "lewis6991/gitsigns.nvim" },
		"nvim-lua/plenary.nvim",
		"sindrets/diffview.nvim",
		"nvim-telescope/telescope.nvim",
	},
	opts = {},
	keys = {
		{ "<leader>gs", mode = { "n" }, "<cmd>Neogit<cr>" },
	},
}
