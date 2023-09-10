return {
	"kevinhwang91/nvim-fundo",
	dependencies = {
		{ "kevinhwang91/promise-async" },
		{
			"mbbill/undotree",
			config = function()
				vim.g.undotree_WindowLayout = 2
				vim.g.undotree_DiffAutoOpen = 0
				vim.g.undotree_SetFocusWhenToggle = 1
				vim.g.undotree_ShortIndicators = 1
				vim.g.undotree_HelpLine = 0
			end,
		},
	},
	build = function()
		require("fundo").install()
	end,
	opts = {},
	keys = {
		{ "<leader>u", "<Cmd>UndotreeToggle<CR>", desc = "Undo Tree" },
	},
}
