local values = require("core.values")

return {
    -- # load before nvim-lspconfig
    {
        "ray-x/lsp_signature.nvim",
        event = "VeryLazy",
        opts = {
            bind = true,
            handler_opts = {
                border = "single",
            },
        },
        config = function(_, opts)
            require("lsp_signature").setup(opts)
        end,
    },
    {
        "hrsh7th/cmp-nvim-lsp",
        event = "VeryLazy",
    },
    -- # nvim-lspconfig
    {
        "neovim/nvim-lspconfig",
        event = { "BufReadPre", "BufNewFile" },
        config = function()
            require("core.lsp")
        end,
        keys = {
            {
                "gd",
                vim.lsp.buf.definition,
                "n",
                desc = "Goto definition",
            },
            { "gD", vim.lsp.buf.type_definition, "n", desc = "Goto type definition" },
            { "gi", vim.lsp.buf.implementation, "n", desc = "Goto implementation" },
            { "K", vim.lsp.buf.hover, "n", desc = "Display hover information" },
            {
                "<C-k>",
                function()
                    require("lsp_signature").toggle_float_win()
                end,
                "n",
                desc = "Display signature information",
            },
            { "gr", vim.lsp.buf.references, "n", desc = "List references" },
            { "[d", vim.diagnostic.goto_prev, "n", desc = "Go to previous diagnostic" },
            { "]d", vim.diagnostic.goto_next, "n", desc = "Go to next diagnostic" },
            { "<leader>d", vim.diagnostic.setloclist, "n", desc = "Set loclist" },
            { "<leader>aa", vim.diagnostic.setqflist, "n", desc = "Show all workspace diagnostics" },
            {
                "<leader>ae",
                function()
                    vim.diagnostic.setqflist({ severity = "E" })
                end,
                "n",
                desc = "Show all workspace errors",
            },
            {
                "<leader>aw",
                function()
                    vim.diagnostic.setqflist({ severity = "W" })
                end,
                "n",
                desc = "Show all workspace warnings",
            },

            { "<leader>ca", vim.lsp.codelens.run, "n", desc = "Code action" },
            { "<leader>rn", vim.lsp.buf.rename, "n", desc = "Rename" },
        },
        dependencies = {
            "ray-x/lsp_signature.nvim",
            "hrsh7th/cmp-nvim-lsp",
            "b0o/schemastore.nvim",
            "williamboman/mason.nvim",
            "williamboman/mason-lspconfig.nvim",
            "WhoIsSethDaniel/mason-tool-installer.nvim",
            "folke/neoconf.nvim",

            "Hoffs/omnisharp-extended-lsp.nvim",
        },
    },
    -- # load after nvim-lspconfig
    {
        "folke/trouble.nvim",
        cmd = "TroubleToggle",
        keys = { { "<leader>xx", ":TroubleToggle<CR>", "n", desc = "Toggle trouble quickfix" } },
        dependencies = { "nvim-tree/nvim-web-devicons", "neovim/nvim-lspconfig" },
        config = function()
            require("trouble").setup({
                signs = {
                    error = values.diagnostic_signs.Error,
                    warning = values.diagnostic_signs.Warn,
                    information = values.diagnostic_signs.Info,
                    hint = values.diagnostic_signs.Hint,
                    other = "󰗡",
                },
            })
        end,
    },
    {
        "j-hui/fidget.nvim",
        event = { "BufReadPre", "BufNewFile" },
        enabled = not values.use_noice,
        dependencies = { "neovim/nvim-lspconfig" },
        config = function()
            require("fidget").setup({
                progress = {
                    poll_rate = 60,
                },
                notification = {
                    poll_rate = 60,
                    override_vim_notify = true,
                    window = {
                        max_width = 120,
                    },
                },
            })
        end,
    },
    -- {
    --     "kosayoda/nvim-lightbulb",
    --     opts = {
    --         virtual_text = { enabled = true, text = "" },
    --         autocmd = { enabled = true },
    --     },
    -- },
}
