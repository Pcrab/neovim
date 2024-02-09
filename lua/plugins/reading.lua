-- [nfnl] Compiled from fnl/plugins/reading.fnl by https://github.com/Olical/nfnl, do not edit.
local function _1_()
  local highlight = {"RainbowRed", "RainbowYellow", "RainbowBlue", "RainbowOrange", "RainbowGreen", "RainbowViolet", "RainbowCyan"}
  local hooks = require("ibl.hooks")
  local function _2_()
    vim.api.nvim_set_hl(0, "RainbowRed", {fg = "#E06C75"})
    vim.api.nvim_set_hl(0, "RainbowYellow", {fg = "#E5C07B"})
    vim.api.nvim_set_hl(0, "RainbowBlue", {fg = "#61AFEF"})
    vim.api.nvim_set_hl(0, "RainbowOrange", {fg = "#D19A66"})
    vim.api.nvim_set_hl(0, "RainbowGreen", {fg = "#98C379"})
    vim.api.nvim_set_hl(0, "RainbowViolet", {fg = "#C678DD"})
    return vim.api.nvim_set_hl(0, "RainbowCyan", {fg = "#56B6C2"})
  end
  hooks.register(hooks.type.HIGHLIGHT_SETUP, _2_)
  vim.g.rainbow_delimiters = {highlight = highlight}
  do end (require("ibl")).setup({indent = {highlight = highlight}})
  return hooks.register(hooks.type.SCOPE_HIGHLIGHT, hooks.builtin.scope_highlight_from_extmark)
end
local function _3_()
  local spider = require("spider")
  return spider.motion("e")
end
local function _4_()
  local spider = require("spider")
  return spider.motion("w")
end
local function _5_()
  local spider = require("spider")
  return spider.motion("b")
end
return {{"lukas-reineke/indent-blankline.nvim", dependencies = {"nvim-treesitter/nvim-treesitter", "https://gitlab.com/HiPhish/rainbow-delimiters.nvim"}, event = {"BufReadPre", "BufNewFile"}, main = "ibl", config = _1_}, {"chrisgrieser/nvim-spider", keys = {{"e", _3_, mode = {"n", "o", "x"}}, {"w", _4_, mode = {"n", "o", "x"}}, {"b", _5_, mode = {"n", "o", "x"}}}}}
