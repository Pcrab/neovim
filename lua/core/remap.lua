vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

vim.keymap.set("n", "Y", "yg$")
vim.keymap.set("n", "J", "mzJ`z")
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

vim.keymap.set("x", "<leader>p", '"_dP')
vim.keymap.set("n", "<leader>p", '"+p')
vim.keymap.set("v", "<leader>p", '"+p')

vim.keymap.set("n", "<leader>y", '"+y')
vim.keymap.set("v", "<leader>y", '"+y')
vim.keymap.set("n", "<leader>Y", '"+Y')

vim.keymap.set("n", "<leader>d", '"_d')
vim.keymap.set("v", "<leader>d", '"_d')

vim.keymap.set("n", "Q", "<NOP>")
vim.keymap.set("n", "s", "<NOP>")

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

vim.keymap.set("n", "<leader>q", toggle_quickfix, { desc = "Quickfix" })

local filetype_keymaps = vim.api.nvim_create_augroup("ofseed_filetype_keymaps", {})
vim.api.nvim_create_autocmd("Filetype", {
    group = filetype_keymaps,
    pattern = "qf",
    callback = function(args)
        local bufnr = args.buf
        vim.keymap.set("n", "q", "<Cmd>cclose<CR>", { buffer = bufnr })
    end,
})
