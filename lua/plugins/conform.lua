return {
    "stevearc/conform.nvim",
    dependencies = {
        "mfussenegger/nvim-lint",
    },
    config = function()
        require("conform").setup({
            formatters = {
                fourmolu = {
                    command = "fourmolu",
                    args = { "$FILENAME" },
                    cwd = require("conform.util").root_file({ ".formatter.exs" }),
                },
            },
            formatters_by_ft = {
                lua = { "stylua" },
                -- Conform will use the first available formatter in the list
                javascript = { "prettier_d", "prettier" },
                typescript = { "prettier_d", "prettier" },
                -- Formatters can also be specified with additional options
                python = {
                    formatters = { "isort", "black" },
                    -- Run formatters one after another instead of stopping at the first success
                    run_all_formatters = true,
                },
                c = { "clang_format" },
                cpp = { "clang_format" },
                haskell = { "fourmolu" },
            },
            format_on_save = {
                -- These options will be passed to conform.format()
                timeout_ms = 500,
                lsp_fallback = true,
            },
        })
    end,
    lazy = false,
    keys = {
        {

            "<leader>vf",
            function()
                require("conform").format({})
            end,
            desc = "Format",
        },
    },
}
