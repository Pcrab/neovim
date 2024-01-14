-- [nfnl] Compiled from fnl/config/init.fnl by https://github.com/Olical/nfnl, do not edit.
local _local_1_ = require("nfnl.module")
local autoload = _local_1_["autoload"]
local nvim = autoload("nvim")
local core = autoload("nfnl.core")
nvim.set_keymap("n", "<space>", "<nop>", {noremap = true})
do
  local options = {expandtab = true, tabstop = 4, shiftwidth = 4, softtabstop = 4, completeopt = "menuone,noselect", ignorecase = true, smartcase = true, clipboard = "unnamedplus", number = true, relativenumber = true, ruler = true, signcolumn = "yes", colorcolumn = "120", cursorline = true, cursorcolumn = true, scrolloff = 10}
  for option, value in pairs(options) do
    core.assoc(nvim.o, option, value)
  end
end
require("config.keymaps")
return {}
