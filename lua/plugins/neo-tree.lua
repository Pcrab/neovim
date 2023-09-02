require("neo-tree").setup({
	window = {
		position = "left",
	},
})

vim.keymap.set("n", "<leader>tt", "<cmd>Neotree toggle<cr>")
vim.keymap.set("n", "<leader>tg", "<cmd>Neotree source=git_status reveal=true toggle<cr>")
vim.keymap.set("n", "<leader>tr", "<cmd>Neotree reveal=true toggle<cr>")
