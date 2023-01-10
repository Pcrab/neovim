local glob = require("glob")

glob.g.mapleader = " "
glob.g.maplocalleader = " "
vim.keymap.set("n", "<BS>", ":nohlsearch<CR>")
vim.keymap.set("", "s", "<nop>", {})
local opts = { noremap = true, silent = true }

local nt_api = require("nvim-tree.api")
vim.keymap.set("n", "<leader>eo", nt_api.tree.toggle, opts)
vim.keymap.set("n", "<leader>ee", nt_api.tree.focus, opts)

-- window
vim.keymap.set("n", "sh", ":vs<cr>", opts)
vim.keymap.set("n", "sj", ":sp<cr><C-w>j", opts)
vim.keymap.set("n", "sk", ":sp<cr>", opts)
vim.keymap.set("n", "sl", ":vs<cr><C-w>l", opts)
vim.keymap.set("n", "<leader>wh", "<C-w>h", opts)
vim.keymap.set("n", "<leader>wj", "<C-w>j", opts)
vim.keymap.set("n", "<leader>wk", "<C-w>k", opts)
vim.keymap.set("n", "<leader>wl", "<C-w>l", opts)

-- plugin
vim.keymap.set("n", "<leader>ps", ":PackerSync<cr>", opts)
vim.keymap.set("n", "<leader>pi", ":PackerInstall<cr>", opts)
vim.keymap.set("n", "<leader>pc", ":PackerCompile<cr>", opts)

-- lsp
vim.keymap.set('n', '[d', ":Lspsaga diagnostic_jump_prev<cr>", opts)
vim.keymap.set('n', ']d', ":Lspsaga diagnostic_jump_next<cr>", opts)
vim.keymap.set('n', '[D', function() require("lspsaga.diagnostic").goto_prev({ severity = vim.diagnostic.severity.ERROR }) end, opts)
vim.keymap.set('n', ']D', function() require("lspsaga.diagnostic").goto_next({ severity = vim.diagnostic.severity.ERROR }) end, opts)

vim.keymap.set("n", "<leader>gD", vim.lsp.buf.declaration, opts)
vim.keymap.set("n", "<leader>gd", ":Lspsaga peek_definition<cr>", opts)
vim.keymap.set("n", "<leader>gi", vim.lsp.buf.implementation, opts)
vim.keymap.set("n", "<leader>gr", vim.lsp.buf.references, opts)
vim.keymap.set("n", "K", ":Lspsaga hover_doc<cr>", opts)
vim.keymap.set("n", "<C-k>", vim.lsp.buf.signature_help, opts)
vim.keymap.set("n", "<leader>D", vim.lsp.buf.type_definition, opts)
vim.keymap.set("n", "<leader>d", "<cmd>Lspsaga show_line_diagnostics<CR>", { silent = true })
vim.keymap.set("n", "<leader>d", "<cmd>Lspsaga show_cursor_diagnostics<CR>", { silent = true })
vim.keymap.set("n", "<leader>lr", ":Lspsaga rename<cr>", opts)
vim.keymap.set("n", "<leader>lc", ":Lspsaga code_action<cr>", opts)
vim.keymap.set("n", "<leader>lf", function() vim.lsp.buf.format() end, opts)
