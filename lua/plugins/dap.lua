return {
    "rcarriga/nvim-dap-ui",
    dependencies = {
        "mfussenegger/nvim-dap",
    },
    opts = {
        controls = {
            element = "repl",
            enabled = true,
            icons = {
                pause = "",
                play = "",
                run_last = "",
                step_back = "",
                step_into = "",
                step_out = "",
                step_over = "",
                terminate = "",
            },
        },
        element_mappings = {},
        expand_lines = true,
        floating = {
            border = "rounded",
            mappings = {
                close = { "q", "<Esc>" },
            },
        },
        force_buffers = true,
        icons = {
            collapsed = "",
            current_frame = "",
            expanded = "",
        },
        layouts = {
            {
                elements = {
                    {
                        id = "scopes",
                        size = 0.25,
                    },
                    {
                        id = "breakpoints",
                        size = 0.25,
                    },
                    {
                        id = "stacks",
                        size = 0.25,
                    },
                    {
                        id = "watches",
                        size = 0.25,
                    },
                },
                position = "left",
                size = 40,
            },
            {
                elements = {
                    {
                        id = "repl",
                        size = 0.5,
                    },
                    {
                        id = "console",
                        size = 0.5,
                    },
                },
                position = "bottom",
                size = 10,
            },
        },
        mappings = {
            edit = "e",
            expand = { "<CR>", "<2-LeftMouse>" },
            open = "o",
            remove = "d",
            repl = "r",
            toggle = "t",
        },
        render = {
            indent = 1,
            max_value_lines = 100,
        },
    },
    keys = {
        {
            "<leader>dc",
            mode = { "n" },
            desc = "continue",
            function()
                require("dap").continue()
            end,
        },
        {
            "<leader>dr",
            mode = { "n" },
            desc = "toggle repl",
            function()
                require("dap").repl.toggle()
            end,
        },
        {
            "<leader>dK",
            mode = { "n" },
            desc = "widgets hover",
            function()
                require("dap.ui.widgets").hover()
            end,
        },
        {
            "<leader>dt",
            mode = { "n" },
            desc = "toggle breakpoint",
            function()
                require("dap").toggle_breakpoint()
            end,
        },
        {
            "<leader>do",
            mode = { "n" },
            desc = "step over",
            function()
                require("dap").step_over()
            end,
        },
        {
            "<leader>dsi",
            mode = { "n" },
            desc = "step into",
            function()
                require("dap").step_into()
            end,
        },
        {
            "<leader>dso",
            mode = { "n" },
            desc = "step out",
            function()
                require("dap").step_out()
            end,
        },
        {
            "<leader>dl",
            mode = { "n" },
            function()
                require("dap").run_last()
            end,
        },
        {
            "<leader>du",
            function()
                require("dapui").toggle()
            end,
            desc = "toggle dap ui",
        },
    },
}
