-- [nfnl] Compiled from fnl/config/keymaps.fnl by https://github.com/Olical/nfnl, do not edit.
vim.keymap.set("n", "<leader>p", "\"+P", {noremap = true, desc = "Paste without replace clipboard"})
local function toggle_quickfix()
  local wins = vim.fn.getwininfo()
  local filter = "filter"
  local totable = "totable"
  local qf_win
  local function _1_(win)
    return (win.quickfix == 1)
  end
  qf_win = (function(tgt, m, ...) return tgt[m](tgt, ...) end)((function(tgt, m, ...) return tgt[m](tgt, ...) end)(vim.iter(wins), filter, _1_), totable)
  if (#qf_win == 0) then
    return vim.cmd.cclose()
  else
    return vim.cmd.copen()
  end
end
vim.keymap.set("n", "<leader>q", toggle_quickfix, {desc = "Toggle quickfix"})
local filetype_keymaps = vim.api.nvim_create_augroup("qf_filetype_keymaps", {})
local function _3_(args)
  local bufnr = args.buf
  return vim.keymap.set("n", "q", "<CMD>cclose<CR>", {buffer = bufnr})
end
vim.api.nvim_create_autocmd("Filetype", {group = filetype_keymaps, pattern = "qf", callback = _3_})
vim.keymap.set("n", "gf", "<C-w>f", {desc = "Open file under cursor in split"})
return vim.keymap.set("v", "gf", "<C-w>f", {desc = "Open file under cursor in split"})
