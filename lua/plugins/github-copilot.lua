return {
    {
        'CopilotC-Nvim/CopilotChat.nvim',
        dependencies = {
            { 'zbirenbaum/copilot.lua', cmd = 'Copilot', event = 'InsertEnter', opts = {} },
            { 'nvim-lua/plenary.nvim' },
        },
        build = 'make tiktoken', -- Only on MacOS or Linux
        opts = {
            -- See Configuration section for options
        },
    },
}
