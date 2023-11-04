return {
    "mfussenegger/nvim-dap",
    config = function()
        local dap = require("dap")
        dap.adapters.mix_task = {
            type = "executable",
            command = "elixir-ls-debugger",
            args = {},
        }
        dap.configurations.elixir = {
            {
                type = "mix_task",
                name = "mix test",
                task = "test",
                taskArgs = { "--trace" },
                request = "launch",
                startApps = true, -- for Phoenix projects
                projectDir = "${workspaceFolder}",
                requireFiles = {
                    "test/**/test_helper.exs",
                    "test/**/*_test.exs",
                },
            },
        }
    end,
    keys = {
        {
            "<leader>dc",
            mode = { "n" },
            function()
                require("dap").continue()
            end,
        },
        {
            "<leader>dr",
            mode = { "n" },
            function()
                require("dap").repl.toggle()
            end,
        },
        {
            "<leader>dK",
            mode = { "n" },
            function()
                require("dap.ui.widgets").hover()
            end,
        },
        {
            "<leader>dt",
            mode = { "n" },
            function()
                require("dap").toggle_breakpoint()
            end,
        },
        {
            "<leader>dso",
            mode = { "n" },
            function()
                require("dap").step_over()
            end,
        },
        {
            "<leader>dsi",
            mode = { "n" },
            function()
                require("dap").step_into()
            end,
        },
        {
            "<leader>dl",
            mode = { "n" },
            function()
                require("dap").run_last()
            end,
        },
    },
}
