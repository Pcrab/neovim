return {
    "kevinhwang91/nvim-hlslens",
    opts = {},
    keys = {
        {
            "<leader>L",
            mode = { "n", "x" },
            function()
                vim.schedule(function()
                    if require("hlslens").exportLastSearchToQuickfix() then
                        vim.cmd("cw")
                    end
                end)
                return ":noh<CR>"
            end,
        },
    },
}
