local glob = require("glob")

glob.g.mapleader = " "
glob.g.maplocalleader = " "
glob.map({
    { "n", "<BS>", ":nohlsearch<CR>", {} },
    { "", "s", "<nop>", {} },
})

local opts = { noremap = true, silent = true }

-- Nvim-tree
local nt_api = require("nvim-tree.api")
glob.map({
    { "n", "<leader>eo", nt_api.tree.toggle, opts },
    { "n", "<leader>ee", nt_api.tree.focus, opts }
})

-- window
glob.map({
    { "n", "sh", ":vs<cr>", opts },
    { "n", "sj", ":sp<cr><C-w>j", opts },
    { "n", "sk", ":sp<cr>", opts },
    { "n", "sl", ":vs<cr><C-w>l", opts },
    { "n", "<leader>wh", "<C-w>h", opts },
    { "n", "<leader>wj", "<C-w>j", opts },
    { "n", "<leader>wk", "<C-w>k", opts },
    { "n", "<leader>wl", "<C-w>l", opts },
})

-- plugin
glob.map({
    { "n", "<leader>ps", ":PackerSync<cr>", opts },
    { "n", "<leader>pi", ":PackerInstall<cr>", opts },
    { "n", "<leader>pc", ":PackerCompile<cr>", opts },
})

