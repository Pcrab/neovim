--@class LspConfig: table
---@field autoload boolean if autoload by nvim-lspconfig
---@field root_patterns? string[] see lspconfig.util.root_pattern
---@field config? table<string, any> lsp config
local servers = {} ---@type table<string, LspConfig>

servers.lua_ls = {
    autoload = true,
    config = {
        settings = {
            Lua = {
                format = { enable = true },
                runtime = {
                    version = "LuaJIT",
                },
                diagnostics = {
                    globals = { "vim" },
                },
                workspace = {
                    checkThirdParty = false,
                },
                telemetry = {
                    enable = false,
                },
            },
        },
    },
}

servers.vimls = {
    autoload = true,
}

servers.yamlls = {
    autoload = true,
}

servers.jsonls = {
    autoload = true,
}

servers.rust_analyzer = {
    autoload = true,
    config = {
        settings = {
            ["rust-analyzer"] = {
                diagnostics = {
                    diagnostics = { disabled = { "unresolved-proc-macro" } },
                    checkOnSave = { command = "clippy" },
                },
            },
        },
    },
}

servers.tsserver = {
    autoload = true,
    root_patterns = { "tsconfig.json", "jsconfig.json", "package.json" },
    config = {
        single_file_support = true, -- Don't start in deno files
    },
}

servers.tailwindcss = {
    autoload = true,
    root_patterns = { "tailwind.config.js", "tailwind.config.ts" },
}

servers.prismals = {
    autoload = true,
    root_patterns = { "prisma/schema.prisma" },
}

servers.cssls = {
    autoload = true,
    config = {
        lint = {
            unknownAtRules = "ignore",
        },
    },
}

servers.html = {
    autoload = true,
}

servers.ruff_lsp = {
    autoload = true,
}

servers.pylyzer = {
    autoload = true,
}

servers.zls = {
    autoload = true,
}

---@class FiletypeConfig
---@field enable boolean
---@field formatters? string[]
---@field linters? string[]
---@field tools? string[]
---@type table<string, FiletypeConfig>
local filetypes = {
    lua = { enable = true, formatters = { "stylua" } },
    css = { enable = true, formatters = { "prettier" } },
    html = { enable = true, formatters = { "prettier" } },
    json = { enable = true, formatters = { "prettier" } },
    yaml = { enable = true, formatters = { "prettier" } },
    markdown = { enable = true, formatters = { "prettier" } },
    typescript = { enable = true, formatters = { "prettier" }, linters = { "eslint_d" } },
    python = { enable = true },
}

return {
    servers = servers,
    filetypes = filetypes,
}
