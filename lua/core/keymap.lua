vim.keymap.set("n", "<BS>", "<CMD>nohlsearch<CR>")

vim.keymap.set("n", "gd", "<CMD>FzfLua lsp_definitions<CR>")
vim.keymap.set("n", "gr", "<CMD>FzfLua lsp_references<CR>")
vim.keymap.set("n", "K", vim.lsp.buf.hover)
vim.keymap.set("n", "<leader>ra", vim.lsp.buf.rename)
vim.keymap.set("n", "<leader>ca", "<CMD>lsp_code_actions<CR>")
vim.keymap.set("n", "<leader>cl", vim.lsp.codelens.run)

vim.keymap.set("n", "<leader><leader>", "<CMD>FzfLua files<CR>")
vim.keymap.set("n", "<leader>s", "<CMD>FzfLua live_grep<CR>")
vim.keymap.set("n", "<leader>S", "<CMD>FzfLua live_grep_resume<CR>")
vim.keymap.set("n", "*", "<CMD>FzfLua grep_cword<CR>")

vim.keymap.set("n", "<leader>d", "<CMD>FzfLua diagnostics_document<CR>")
vim.keymap.set("n", "<leader>D", "<CMD>FzfLua diagnostics_workspace<CR>")
