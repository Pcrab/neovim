return {
    "elixir-tools/elixir-tools.nvim",
    config = function()
        local elixir = require("elixir")
        local elixirls = require("elixir.elixirls")

        elixir.setup({
            elixirls = {
                -- default settings, use the `settings` function to override settings
                settings = elixirls.settings({
                    dialyzerEnabled = true,
                    fetchDeps = false,
                    enableTestLenses = false,
                    suggestSpecs = true,
                }),
                on_attach = function()
                    -- vim.keymap.set("n", "<leader>fp", ":ElixirFromPipe<cr>", { buffer = true, noremap = true })
                    -- vim.keymap.set("n", "<leader>tp", ":ElixirToPipe<cr>", { buffer = true, noremap = true })
                    vim.keymap.set("v", "<leader>em", ":ElixirExpandMacro<cr>", { buffer = true, noremap = true })
                end,
            },
        })
    end,
    ft = { "elixir" },
}
