return {
    -- indent hint
    {
        "lukas-reineke/indent-blankline.nvim",
        dependencies = { "nvim-treesitter/nvim-treesitter" },
        event = { "BufReadPre", "BufNewFile" },
        main = "ibl",
        opts = {
            indent = { char = "¦" },
            exclude = {
                buftypes = { "help", "nofile", "nowrite", "quickfix", "terminal", "prompt" },
            },
            scope = { enabled = false },
        },
    },
    -- highlight color value
    { "norcalli/nvim-colorizer.lua", cmd = "ColorizerToggle" },
    -- jump
    {
        "smoka7/hop.nvim",
        version = "*",
        opts = {},
        keys = {
            {
                "f",
                mode = { "n", "x" },
                function()
                    local directions = require("hop.hint").HintDirection
                    require("hop").hint_char1({ direction = directions.AFTER_CURSOR, current_line_only = true })
                end,
            },
            {
                "F",
                mode = { "n", "x" },
                function()
                    local directions = require("hop.hint").HintDirection
                    require("hop").hint_char1({ direction = directions.BEFORE_CURSOR, current_line_only = true })
                end,
            },
            {
                "t",
                mode = { "n", "x" },
                function()
                    local directions = require("hop.hint").HintDirection
                    require("hop").hint_char1({
                        direction = directions.AFTER_CURSOR,
                        current_line_only = true,
                        hint_offset = -1,
                    })
                end,
            },
            {
                "T",
                mode = { "n", "x" },
                function()
                    local directions = require("hop.hint").HintDirection
                    require("hop").hint_char1({
                        direction = directions.BEFORE_CURSOR,
                        current_line_only = true,
                        hint_offset = 1,
                    })
                end,
            },
        },
    },
}
