return {
    {
        'CopilotC-Nvim/CopilotChat.nvim',
        dependencies = {
            { 'github/copilot.vim' },
            { 'nvim-lua/plenary.nvim' },
        },
        build = 'make tiktoken', -- Only on MacOS or Linux
        opts = {
            -- See Configuration section for options
        },
    },
}
