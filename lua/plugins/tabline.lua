return {
    {
        "akinsho/bufferline.nvim",
        version = "*",
        dependencies = "nvim-tree/nvim-web-devicons",
        lazy = false,
        keys = {
            { "<Tab>", "<CMD>BufferLineCycleNext<CR>", desc = "Next tab" },
            { "<S-Tab>", "<CMD>BufferLineCyclePrev<CR>", desc = "Prev tab" },

            { "<leader>to", "<CMD>BufferLineCloseOthers<CR>", desc = "Close other tabs" },
            { "<leader>tx", "<CMD>BufferLinePickClose<CR>", desc = "Pick tab to close" },
            { "<leader>tp", "<CMD>BufferLinePick<CR>", desc = "Pick tab" },

            { "<leader>tmn", "<CMD>BufferLineMoveNext<CR>", desc = "Move current tab to next" },
            { "<leader>tmp", "<CMD>BufferLineMovePrev<CR>", desc = "Move current tab to prev" },

            -- vim.keymap.set("n", "<leader>tc", ":$tabnew<CR>", { desc = "Create new tab" })
            -- vim.keymap.set("n", "<leader>tx", ":tabclose<CR>", { desc = "Close current tab" })
            -- vim.keymap.set("n", "<leader>to", ":tabonly<CR>", { desc = "Close other tabs" })
            -- vim.keymap.set("n", "<leader>tmp", ":-tabmove<CR>", { desc = "Move current tab to previous position" })
            -- vim.keymap.set("n", "<leader>tmn", ":+tabmove<CR>", { desc = "Move current tab to next position " })
        },
        opts = {
            options = {
                mode = true,
                show_buffer_close_icon = false,
                show_close_icon = false,
            },
        },
    },
}
