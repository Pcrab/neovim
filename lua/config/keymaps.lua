vim.keymap.set({ 'n' }, 'gh', '0')
vim.keymap.set({ 'n' }, 'gs', '^')
vim.keymap.set({ 'n' }, 'gl', '$')

vim.keymap.set({ 'n' }, 'gK', vim.lsp.buf.signature_help, { desc = 'Signature help' })
vim.keymap.set({ 'n' }, '<leader>ca', vim.lsp.buf.code_action, { desc = 'Code action' })
vim.keymap.set({ 'n' }, '<leader>cc', vim.lsp.codelens.run, { desc = 'Code lens' })
vim.keymap.set({ 'n' }, '<leader>cC', vim.lsp.codelens.refresh, { desc = 'Code lens refresh' })
vim.keymap.set({ 'n' }, '<leader>cr', vim.lsp.buf.rename, { desc = 'Rename' })
vim.keymap.set({ 'n' }, '<leader>cR', function()
    require('snacks').rename.rename_file()
end, { desc = 'Rename File' })

vim.keymap.set('i', '<Tab>', function()
    if require('copilot.suggestion').is_visible() then
        require('copilot.suggestion').accept()
    else
        vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes('<Tab>', true, false, true), 'n', false)
    end
end, { desc = 'Super Tab' })
