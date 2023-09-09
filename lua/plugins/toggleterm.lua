return {
	"akinsho/toggleterm.nvim",
	version = "*",
	opts = {
		direction = "float",
	},
	keys = {
		{ "<C-\\>", mode = { "n", "t", "i" }, "<cmd>ToggleTerm<cr>" },
	},
}
