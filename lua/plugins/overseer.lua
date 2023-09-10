return {
    "stevearc/overseer.nvim",
    config = function()
        local overseer = require("overseer")

        overseer.setup({
            strategy = {
                "toggleterm",
                quit_on_exit = "success",
            },
            component_aliases = {
                default = {
                    { "display_duration", detail_level = 2 },
                    "on_output_summarize",
                    "on_exit_set_status",
                    "on_complete_notify",
                    "on_complete_dispose",
                    "unique",
                },
            },
        })
    end,
    keys = {
        { "<leader>rr", "<cmd>OverseerRun<CR>", desc = "Run" },
        { "<leader>rl", "<cmd>OverseerToggle<CR>", desc = "List" },
        { "<leader>rn", "<cmd>OverseerBuild<CR>", desc = "New" },
        { "<leader>ra", "<cmd>OverseerTaskAction<CR>", desc = "Action" },
        { "<leader>ri", "<cmd>OverseerInfo<CR>", desc = "Info" },
        { "<leader>rc", "<cmd>OverseerClearCache<CR>", desc = "Clear cache" },
    },
}
