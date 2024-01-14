-- [nfnl] Compiled from fnl/plugins/search.fnl by https://github.com/Olical/nfnl, do not edit.
local function _1_()
  local telescope = require("telescope.builtin")
  return telescope.find_files()
end
local function _2_()
  local telescope = require("telescope.builtin")
  return telescope.live_grep()
end
local function _3_()
  local telescope = require("telescope.builtin")
  return telescope.help_tags()
end
local function _4_()
  local telescope = require("telescope.builtin")
  return telescope.buffers()
end
local function _5_()
  local telescope = require("telescope")
  telescope.setup({defaults = {preview = {filesize_limit = 0.5, timeout = 100}}, extensions = {fzf = {fuzzy = true, override_generic_sorter = true, override_file_sorter = true, case_mode = "smart_case"}}})
  telescope.load_extension("fzf")
  return telescope.load_extension("ui-select")
end
return {{"nvim-telescope/telescope.nvim", event = "VeryLazy", dependencies = {"nvim-lua/plenary.nvim", {"nvim-telescope/telescope-fzf-native.nvim", build = "make"}, "nvim-telescope/telescope-ui-select.nvim"}, keys = {{"<leader>ff", _1_, mode = "n", desc = "Find files"}, {"<leader>fg", _2_, mode = "n", desc = "Live grep"}, {"<leader>fh", _3_, mode = "n", desc = "Find helps"}, {"<leader>fb", _4_, mode = "n", desc = "Find buffers"}}, config = _5_}}
