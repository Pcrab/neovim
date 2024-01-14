-- [nfnl] Compiled from fnl/plugins/basics.fnl by https://github.com/Olical/nfnl, do not edit.
local function _1_()
  local persistence = require("persistence")
  return persistence.load()
end
return {{"folke/which-key.nvim", event = "VeryLazy", opts = {}}, {"wakatime/vim-wakatime"}, {"folke/persistence.nvim", opts = {}, event = "BufReadPre", keys = {{"<leader>s", _1_, mode = "n", desc = "Load session"}}}}
