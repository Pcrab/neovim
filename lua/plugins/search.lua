require("fzf-lua").setup({})

local fzf = require("fzf-lua")

vim.keymap.set("n", "<leader>ff", function()
	fzf.files()
end)
vim.keymap.set("n", "<leader>fg", function()
	fzf.live_grep()
end)
