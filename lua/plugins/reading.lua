-- [nfnl] Compiled from fnl/plugins/reading.fnl by https://github.com/Olical/nfnl, do not edit.
local function _1_()
  local spider = require("spider")
  return spider.motion("e")
end
local function _2_()
  local spider = require("spider")
  return spider.motion("w")
end
local function _3_()
  local spider = require("spider")
  return spider.motion("b")
end
return {{"lukas-reineke/indent-blankline.nvim", dependencies = {"nvim-treesitter/nvim-treesitter"}, event = {"BufReadPre", "BufNewFile"}, main = "ibl", opts = {indent = {char = "\194\166"}, exclude = {buftypes = {"help", "nofile", "nowrite", "quickfix", "terminal", "prompt"}}, scope = {enabled = false}}}, {"chrisgrieser/nvim-spider", keys = {{"e", _1_, mode = {"n", "o", "x"}}, {"w", _2_, mode = {"n", "o", "x"}}, {"b", _3_, mode = {"n", "o", "x"}}}}}
