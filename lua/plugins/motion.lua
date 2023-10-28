return {
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
}
