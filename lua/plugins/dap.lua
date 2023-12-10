return {
    {
        "mfussenegger/nvim-dap",
        config = function()
            local dap = require("dap")
            -- .NET
            dap.adapters.coreclr = {
                type = "executable",
                command = "netcoredbg",
                args = { "--interpreter=vscode" },
            }

            local function dotnet_build_project()
                local default_path = vim.fn.getcwd() .. "/"
                if vim.g["dotnet_last_proj_path"] ~= nil then
                    default_path = vim.g["dotnet_last_proj_path"]
                end
                local path =
                    vim.fn.input({ prompt = "Path to your *proj file: ", default = default_path, completion = "file" })
                vim.g["dotnet_last_proj_path"] = path
                -- local cmd = 'dotnet build -c Debug "' .. path .. '" 2> /tmp/dap-debug-nvim-dotnet.log'
                local cmd = 'dotnet build -c Debug "' .. path .. '"'
                print("\n")
                print("Cmd to execute: " .. cmd)
                local f = os.execute(cmd)
                if f == 0 then
                    print("\nBuild: OK")
                else
                    print("\nBuild: ERR" .. "(code: " .. f .. ")")
                end
            end

            local function get_dll_path()
                local request = function()
                    return vim.fn.input({
                        prompt = "Path to dll: ",
                        default = vim.fn.getcwd() .. "/bin/Debug/",
                        completion = "file",
                    })
                end

                if vim.g["dotnet_last_dll_path"] == nil then
                    vim.g["dotnet_last_dll_path"] = request()
                else
                    if
                        vim.fn.confirm(
                            "Do you want to change the path to dll?\n" .. vim.g["dotnet_last_dll_path"],
                            "&yes\n&no",
                            2
                        ) == 1
                    then
                        vim.g["dotnet_last_dll_path"] = request()
                    end
                end
                return vim.g["dotnet_last_dll_path"]
            end
            local dotnet_config = {
                {
                    type = "coreclr",
                    name = "launch - netcoredbg",
                    request = "launch",
                    console = "integratedTerminal",
                    program = function()
                        if vim.fn.confirm("Should I recompile first?", "&yes\n&no", 2) == 1 then
                            dotnet_build_project()
                        end
                        return get_dll_path()
                    end,
                },
            }
            dap.configurations.cs = dotnet_config
            dap.configurations.fsharp = dotnet_config
        end,
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
        dependencies = {
            "jay-babu/mason-nvim-dap.nvim",
            "LiadOz/nvim-dap-repl-highlights",
            "theHamsta/nvim-dap-virtual-text",
            "rcarriga/nvim-dap-ui",
        },
    },
    {
        "rcarriga/nvim-dap-ui",
        lazy = true,
        config = function()
            local dap, dapui = require("dap"), require("dapui")
            dap.listeners.after.event_initialized["dapui_config"] = function()
                dapui.open()
            end
            dap.listeners.before.event_terminated["dapui_config"] = function()
                dapui.close()
            end
            dap.listeners.before.event_exited["dapui_config"] = function()
                dapui.close()
            end
            dapui.setup()
        end,
        keys = {
            {
                "<leader>du",
                function()
                    require("dapui").toggle()
                end,
                desc = "Toggle UI",
            },
        },
    },
    {
        "theHamsta/nvim-dap-virtual-text",
        -- Only loads when nvim-dap is loaded
        lazy = true,
        opts = {},
    },
    {
        "LiadOz/nvim-dap-repl-highlights",
        -- Only loads when nvim-dap is loaded
        lazy = true,
        opts = {},
    },
}
