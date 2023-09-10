local opts = {
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
}

return {
    "rcarriga/nvim-dap-ui",
    requires = {
        "mfussenegger/nvim-dap",
    },
    opts = opts,
    keys = {
        {
            "<leader>du",
            function()
                require("dapui").toggle()
            end,
            desc = "Toggle UI",
        },
    },
    lazy = false,
    config = function()
        local dapui = require("dapui")
        dapui.setup({})

        local dap = require("dap")
        dap.listeners.after.event_initialized["dapui_config"] = function()
            dapui.open({})
        end

        dap.listeners.before.event_terminated["dapui_config"] = function()
            dapui.close({})
        end

        dap.listeners.before.event_exited["dapui_config"] = function()
            dapui.close({})
        end
    end,
}
