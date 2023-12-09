return {
    "L3MON4D3/LuaSnip",
    keys = {
        {
            "<C-j>",
            mode = { "i", "s" },
            function()
                if require("luasnip").expand_or_jumpable() then
                    require("luasnip").expand_or_jump()
                end
            end,
        },
        {
            "<C-k>",
            mode = { "i", "s" },
            function()
                if require("luasnip").jumpable(-1) then
                    require("luasnip").jump(-1)
                end
            end,
        },
        {
            "<C-l>",
            mode = { "i", "s" },
            function()
                if require("luasnip").choice_active() then
                    require("luasnip").change_choice(1)
                end
            end,
        },
    },
    config = function()
        require("luasnip").setup({
            updateevents = { "TextChanged", "TextChangedI" },
        })
        require("luasnip.loaders.from_vscode").lazy_load()
    end,
    event = "InsertEnter",
    dependencies = {
        "rafamadriz/friendly-snippets",
    },
}
