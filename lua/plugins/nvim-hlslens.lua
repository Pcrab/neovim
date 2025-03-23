return {
    {
        'kevinhwang91/nvim-hlslens',
        config = function()
            local hlslens = require 'hlslens'
            hlslens.setup {
                override_lens = function(render, posList, nearest, idx, relIdx)
                    local sfw = vim.v.searchforward == 1
                    local indicator, text, chunks
                    local absRelIdx = math.abs(relIdx)
                    if absRelIdx > 1 then
                        -- indicator = ('%d%s'):format(absRelIdx, sfw ~= (relIdx > 1) and '▲' or '▼')
                        indicator = ('%d%s'):format(absRelIdx, sfw ~= (relIdx > 1) and 'N' or 'n')
                    elseif absRelIdx == 1 then
                        -- indicator = sfw ~= (relIdx == 1) and '▲' or '▼'
                        indicator = sfw ~= (relIdx == 1) and 'N' or 'n'
                    else
                        indicator = ''
                    end

                    local lnum, col = unpack(posList[idx])
                    local cnt = #posList

                    if indicator ~= '' then
                        text = ('[%s %d/%d]'):format(indicator, idx, cnt)
                    else
                        text = ('[%d/%d]'):format(idx, cnt)
                    end

                    if nearest then
                        chunks = { { ' ' }, { text, 'HlSearchLensNear' } }
                    else
                        chunks = { { ' ' }, { text, 'HlSearchLens' } }
                    end

                    render.setVirt(0, lnum - 1, col - 1, chunks, nearest)
                end,
            }

            local kopts = { noremap = true, silent = true }
            vim.keymap.set({ 'n' }, 'n', [[<Cmd>execute('normal! ' . v:count1 . 'n')<CR><Cmd>lua require('hlslens').start()<CR>]], kopts)
            vim.keymap.set({ 'n' }, 'N', [[<Cmd>execute('normal! ' . v:count1 . 'N')<CR><Cmd>lua require('hlslens').start()<CR>]], kopts)
            vim.keymap.set({ 'n' }, '*', [[*<Cmd>lua require('hlslens').start()<CR>]], kopts)
            vim.keymap.set({ 'n' }, '#', [[#<Cmd>lua require('hlslens').start()<CR>]], kopts)
            vim.keymap.set({ 'n' }, 'g*', [[g*<Cmd>lua require('hlslens').start()<CR>]], kopts)
            vim.keymap.set({ 'n' }, 'g#', [[g#<Cmd>lua require('hlslens').start()<CR>]], kopts)

            vim.keymap.set({ 'n' }, '<BS>', '<CMD>nohlsearch<CR>')
        end,
    },
}
