vim.g.mapleader = " "
vim.g.maplocalleader = " "
vim.keymap.set("", "s", "<nop>", {})
local opts = { noremap = true, silent = true }

local telescope = require("telescope.builtin")
vim.keymap.set("n", "<leader>ff", telescope.find_files, opts)
vim.keymap.set("n", "<leader>fg", telescope.live_grep, opts)
vim.keymap.set("n", "<leader>fb", telescope.buffers, opts)
vim.keymap.set("n", "<leader>fh", telescope.help_tags, opts)

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
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, opts)
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, opts)
vim.keymap.set('n', '<space>q', vim.diagnostic.setloclist, opts)

vim.keymap.set("n", "<leader>gD", vim.lsp.buf.declaration, opts)
vim.keymap.set("n", "<leader>gd", vim.lsp.buf.definition, opts)
vim.keymap.set("n", "<leader>gi", vim.lsp.buf.implementation, opts)
vim.keymap.set("n", "<leader>gr", vim.lsp.buf.references, opts)
vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
vim.keymap.set("n", "<C-k>", vim.lsp.buf.signature_help, opts)
vim.keymap.set("n", "<leader>D", vim.lsp.buf.type_definition, opts)
vim.keymap.set("n", "<leader>lr", vim.lsp.buf.rename, opts)
vim.keymap.set("n", "<leader>lc", vim.lsp.buf.code_action, opts)
vim.keymap.set("n", "<leader>lf", function() vim.lsp.buf.format() end, opts)
