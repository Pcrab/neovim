return {
    {
        'CopilotC-Nvim/CopilotChat.nvim',
        dependencies = {
            {
                'zbirenbaum/copilot.lua',
                cmd = 'Copilot',
                event = 'InsertEnter',
                opts = {
                    auto_trigger = true,
                    suggestion = {
                        keymap = {
                            accept = false,
                        },
                    },
                },
            },
            { 'nvim-lua/plenary.nvim' },
        },
        build = 'make tiktoken', -- Only on MacOS or Linux
        opts = {
            -- See Configuration section for options
            model = 'gemini-2.5-pro',
        },
    },
}
