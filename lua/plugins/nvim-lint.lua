return {
    "mfussenegger/nvim-lint",
    config = function()
        require("lint").linters_by_ft = {
            markdown = { "markdownlint", "prettier" },
            javascript = { "eslint" },
            typescript = { "eslint" },
            c = { "cppcheck" },
            cpp = { "cppcheck" },
            haskell = { "hlint" },
        }

        vim.api.nvim_create_autocmd({ "BufWritePost" }, {
            callback = function()
                require("lint").try_lint()
            end,
        })
    end,
}
