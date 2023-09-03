require("toggleterm").setup({
	direction = "float",
})

vim.keymap.set({ "n", "t", "i" }, "<C-\\>", "<cmd>ToggleTerm<cr>")
