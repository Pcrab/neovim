return {
    "scalameta/nvim-metals",
    dependencies = {
        "nvim-lua/plenary.nvim",
        "mfussenegger/nvim-dap",
    },
    config = function()
        local metals_config = require("metals").bare_config()
        metals_config.settings = {
            showImplicitArguments = true,
        }

        -- Debug settings if you're using nvim-dap
        local dap = require("dap")

        dap.configurations.scala = {
            {
                type = "scala",
                request = "launch",
                name = "Debug main class",
                metals = {
                    runType = "runOrTestFile",
                    --args = { "firstArg", "secondArg", "thirdArg" }, -- here just as an example
                },
            },
            {
                type = "scala",
                request = "launch",
                name = "Test Target",
                metals = {
                    runType = "testTarget",
                },
            },
        }

        metals_config.on_attach = function(client, bufnr)
            require("metals").setup_dap()
        end

        -- Autocmd that will actually be in charging of starting the whole thing
        local api = vim.api
        local nvim_metals_group = api.nvim_create_augroup("nvim-metals", { clear = true })
        api.nvim_create_autocmd("FileType", {
            -- NOTE: You may or may not want java included here. You will need it if you
            -- want basic Java support but it may also conflict if you are using
            -- something like nvim-jdtls which also works on a java filetype autocmd.
            pattern = { "scala", "sbt", "java" },
            callback = function()
                require("metals").initialize_or_attach(metals_config)
            end,
            group = nvim_metals_group,
        })
    end,
}
