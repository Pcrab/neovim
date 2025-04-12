return {
    cmd = { 'lua-language-server' },
    filetypes = { 'lua' },
    root_markers = {
        '.luarc.json',
        '.luarc.jsonc',
        '.luacheckrc',
        '.stylua.toml',
        'stylua.toml',
        'selene.toml',
        'selene.yml',
        '.git',
    },
    settings = {
        Lua = {
            -- Inlay hints
            hint = {
                enable = true,
                setType = true,
                arrayIndex = 'Disable',
            },
            codeLens = {
                enable = true,
            },
            completion = {
                callSnippet = 'Replace',
                postfix = '.',
                displayContext = 50,
            },
            telemetry = {
                enable = false,
            },
            -- Lua LS offers a code formatter
            -- Ref: https://github.com/LuaLS/lua-language-server/wiki/Formatter
            -- format = {
            --     enable = true,
            --     defaultConfig = {
            --         indent_size = "4",
            --         max_line_length = "100",
            --         continuation_indent = "8",
            --     },
            -- },
            -- diagnostics = {
            --     -- Code style checking offered by the Lua LS code formatter
            --     neededFileStatus = {
            --         ["codestyle-check"] = "Any",
            --     },
            -- },
        },
    },
}
