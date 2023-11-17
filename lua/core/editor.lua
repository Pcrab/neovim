local values = require("core.values")

vim.g.mapleader = " "
vim.opt.linebreak = true
vim.opt.showbreak = "->"
vim.opt.mouse = "ar"
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.modelines = 1
vim.opt.colorcolumn = "120"
vim.opt.scrolloff = 10

-- save file helper
vim.api.nvim_create_user_command("SaveAsSudo", function()
    local key = vim.api.nvim_replace_termcodes(":w !sudo tee %", true, false, true)
    vim.api.nvim_feedkeys(key, "t", false)
end, {})

vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.keymap.set("n", "<BS>", ":nohlsearch<CR>", { desc = "Clear search" })

-- Clipboard
vim.keymap.set("v", "<leader>y", '"+y', { desc = "Copy to system clipboard" })
vim.keymap.set("n", "<leader>p", '"+P', { desc = "Paste from system clipboard" })
vim.keymap.set("v", "<leader>p", '"+P', { desc = "Paste from system clipboard" })
vim.keymap.set("v", "<leader>p", '"_dP', { desc = "Not replace clipboard" })

-- Indent
vim.cmd("filetype indent on")
vim.opt.smartindent = true
vim.opt.expandtab = true
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4

-- Tab
vim.keymap.set("n", "<leader>tc", ":$tabnew<CR>", { desc = "Create new tab" })
vim.keymap.set("n", "<leader>tx", ":tabclose<CR>", { desc = "Close current tab" })
vim.keymap.set("n", "<leader>to", ":tabonly<CR>", { desc = "Close other tabs" })
vim.keymap.set("n", "<leader>tp", ":-tabmove<CR>", { desc = "Move current tab to previous position" })
vim.keymap.set("n", "<leader>tn", ":+tabmove<CR>", { desc = "Move current tab to next position " })

-- Diagnostic
-- Diagnostic - keymap
vim.keymap.set("n", "<leader>e", vim.diagnostic.open_float, { desc = "Open diagnostic floating window" })
vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, { desc = "Goto prev diagnostic" })
vim.keymap.set("n", "]d", vim.diagnostic.goto_next, { desc = "Goto next diagnostic" })
-- Diagnostic - sign
local signs = values.diagnostic_signs
for sign, text in pairs(signs) do
    local hl = "DiagnosticSign" .. sign
    vim.fn.sign_define(hl, { text = text, texthl = hl, linehl = "", numhl = "" })
end

-- Neovide
if vim.g.neovide then
    vim.g.neovide_transparency = 0.75
end

-- Quickfix
local function toggle_quickfix()
    local wins = vim.fn.getwininfo()
    local qf_win = vim.iter(wins)
        :filter(function(win)
            return win.quickfix == 1
        end)
        :totable()
    if #qf_win == 0 then
        vim.cmd.copen()
    else
        vim.cmd.cclose()
    end
end
vim.keymap.set("n", "<leader>q", toggle_quickfix, { desc = "Toggle quickfix" })
local filetype_keymaps = vim.api.nvim_create_augroup("ofseed_filetype_keymaps", {})
vim.api.nvim_create_autocmd("Filetype", {
    group = filetype_keymaps,
    pattern = "qf",
    callback = function(args)
        local bufnr = args.buf
        vim.keymap.set("n", "q", "<Cmd>cclose<CR>", { buffer = bufnr })
    end,
})
