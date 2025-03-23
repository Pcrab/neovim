vim.keymap.set({ 'n' }, 'gh', '0')
vim.keymap.set({ 'n' }, 'gs', '^')
vim.keymap.set({ 'n' }, 'gl', '$')

vim.keymap.set({ 'n' }, 'gd', vim.lsp.buf.definition)
vim.keymap.set({ 'n' }, 'gD', vim.lsp.buf.declaration)
