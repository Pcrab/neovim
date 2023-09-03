require("fzf-lua").setup({})

local fzf = require("fzf-lua")

vim.keymap.set("n", "<leader>ff", function()
	fzf.files()
end)

vim.keymap.set("n", "<leader>fF", function()
	fzf.files({
		cmd = "fd --color=never --type f --hidden --follow --no-ignore",
	})
end)

vim.keymap.set("n", "<leader>fg", function()
	fzf.live_grep()
end)

vim.keymap.set("n", "<leader>fG", function()
	fzf.live_grep({
		cmd = "rg --column -n --no-heading --color=always -S -uu",
	})
end)
