local values = {
    theme = {
        name = "everforest",
        -- name = "rose-pine",
        variant = "moon",
        ---@type table<string, string>
        palette = {},
    },
    ---@type table<string, string>
    diagnostic_signs = { Error = "󰅚", Warn = "󰀪", Info = "", Hint = "󰌶" },
    use_global_statusline = false,
}

return values
