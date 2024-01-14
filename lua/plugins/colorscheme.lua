-- [nfnl] Compiled from fnl/plugins/colorscheme.fnl by https://github.com/Olical/nfnl, do not edit.
local function _1_()
  local rose_pine = require("rose-pine")
  rose_pine.setup()
  return vim.cmd("colorscheme rose-pine")
end
return {{"rose-pine/neovim", name = "rose-pine", config = _1_}}
