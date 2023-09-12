vim.fn.sign_define("DapBreakpoint", { text = "", texthl = "DiagnosticError" })
vim.fn.sign_define("DapLogPoint", { text = "", texthl = "DiagnosticInfo" })
vim.fn.sign_define("DapStopped", { text = "", texthl = "Constant" })
vim.fn.sign_define("DapBreakpointRejected", { text = "" })

return {
    "mfussenegger/nvim-dap",
    event = "VeryLazy",
    keys = {
        {
            "<F5>",
            function()
                require("dap").continue()
            end,
            desc = "Debug: Continue",
        },
        {
            "<F10>",
            function()
                require("dap").step_over()
            end,
            desc = "Debug: Step over",
        },
        {
            "<F11>",
            function()
                require("dap").step_into()
            end,
            desc = "Debug: Step into",
        },
        {
            "<F12>",
            function()
                require("dap").step_out()
            end,
            desc = "Debug: Step out",
        },
        {
            "<F9>",
            function()
                require("dap").toggle_breakpoint()
            end,
            desc = "Debug: Toggle breakpoint",
        },

        {
            "<leader>db",
            function()
                require("dap").set_breakpoint(vim.fn.input("Breakpoint condition: "))
            end,
            desc = "Set breakpoint",
        },
        {
            "<leader>dp",
            function()
                require("dap").set_breakpoint(nil, nil, vim.fn.input("Log point message: "))
            end,
            desc = "Set log point",
        },
        {
            "<leader>dr",
            function()
                require("dap").repl.toggle()
            end,
            desc = "Toggle REPL",
        },
        {
            "<leader>dl",
            function()
                require("dap").run_last()
            end,
            desc = "Run last",
        },
    },
    config = function()
        local dap = require("dap")
        dap.adapters.codelldb = {
            type = "server",
            port = "${port}",
            executable = {
                -- CHANGE THIS to your path!
                command = "codelldb",
                args = { "--port", "${port}" },

                -- On windows you may have to uncomment this:
                -- detached = false,
            },
        }
        dap.configurations.cpp = {
            {
                name = "Launch file",
                type = "codelldb",
                request = "launch",
                program = function()
                    return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/", "file")
                end,
                cwd = "${workspaceFolder}",
                stopOnEntry = false,
            },
        }
        dap.configurations.c = dap.configurations.cpp
        dap.configurations.rust = dap.configurations.cpp
        dap.configurations.zig = dap.configurations.cpp

        dap.adapters.coreclr = {
            type = "executable",
            command = "netcoredbg",
            args = { "--interpreter=vscode" },
        }
        dap.configurations.cs = {
            {
                type = "coreclr",
                name = "launch - netcoredbg",
                request = "launch",
                program = function()
                    return vim.fn.input("Path to dll", vim.fn.getcwd() .. "/bin/Debug/", "file")
                end,
            },
        }
        dap.configurations.fsharp = dap.configurations.cs

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
}
