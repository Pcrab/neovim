return {
    {
        "TimUntersberger/neogit",
        cmd = "Neogit",
        dependencies = { "nvim-lua/plenary.nvim", "sindrets/diffview.nvim" },
        config = function()
            require("neogit").setup({ integrations = { diffview = true } })
        end,
        keys = {
            { "<leader>gs", mode = { "n" }, "<cmd>Neogit<cr>" },
        },
    },
    {
        "windwp/nvim-autopairs",
        event = "InsertEnter",
        config = function()
            require("nvim-autopairs").setup({ check_ts = true })
        end,
    },
    {
        "numToStr/Comment.nvim",
        event = { "BufReadPost", "BufNewFile" },
        dependencies = { "JoosepAlviste/nvim-ts-context-commentstring" },
        config = function()
            require("Comment").setup({
                pre_hook = require("ts_context_commentstring.integrations.comment_nvim").create_pre_hook(),
            })
        end,
    },
    {
        "akinsho/toggleterm.nvim",
        version = "*",
        opts = {
            open_mapping = [[<c-\><c-t>]],
            direction = "float",
        },
    },
    {
        "folke/neodev.nvim",
        ft = { "lua" },
        dependencies = { "neovim/nvim-lspconfig" },
        config = function()
            require("neodev").setup({
                override = function(root_dir, options)
                    if root_dir:find("config.*nvim") then
                        -- enable plugins in config managers
                        options.plugins = true
                    end
                end,
            })
        end,
    },
    {
        "stevearc/conform.nvim",
        dependencies = {
            "mfussenegger/nvim-lint",
        },
        init = function()
            -- If you want the formatexpr, here is the place to set it
            vim.o.formatexpr = "v:lua.require'conform'.formatexpr()"
        end,
        cmd = { "ConformInfo" },
        event = { "BufWritePre" },
        config = function()
            -- Allow disable or enable auto format on save
            vim.api.nvim_create_user_command("FormatDisable", function(args)
                if args.bang then
                    -- FormatDisable! will disable formatting just for this buffer
                    vim.b.disable_autoformat = true
                else
                    vim.g.disable_autoformat = true
                end
            end, {
                desc = "Disable autoformat-on-save",
                bang = true,
            })
            vim.api.nvim_create_user_command("FormatEnable", function()
                vim.b.disable_autoformat = false
                vim.g.disable_autoformat = false
            end, {
                desc = "Re-enable autoformat-on-save",
            })
            require("conform").setup({
                formatters_by_ft = {
                    lua = { "stylua" },
                    -- Conform will use the first available formatter in the list
                    javascript = { "eslint_d", "eslint", "prettierd", "prettier" },
                    typescript = { "eslint_d", "eslint", "prettierd", "prettier" },
                    -- Formatters can also be specified with additional options
                    python = {
                        formatters = { "isort", "black" },
                        -- Run formatters one after another instead of stopping at the first success
                        run_all_formatters = true,
                    },
                    cs = { "csharpier" },
                    markdown = {},
                },
                format_on_save = function(bufnr)
                    -- Disable with a global or buffer-local variable
                    if vim.g.disable_autoformat or vim.b[bufnr].disable_autoformat then
                        return
                    end
                    return { timeout_ms = 500, lsp_fallback = true }
                end,
            })
        end,
    },
    {
        "mfussenegger/nvim-lint",
        config = function()
            local lint = require("lint")
            lint.linters_by_ft = {
                javascript = {
                    "eslint_d",
                },
                typescript = {
                    "eslint_d",
                },
                javascriptreact = {
                    "eslint_d",
                },
                typescriptreact = {
                    "eslint_d",
                },
            }
        end,
    },
    {
        "nguyenvukhang/nvim-toggler",
        opts = {},
    },
}
