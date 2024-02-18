-- [nfnl] Compiled from fnl/plugins/editor.fnl by https://github.com/Olical/nfnl, do not edit.
local function _1_()
  local comment_nvim = require("Comment")
  local commentstring = require("ts_context_commentstring.integrations.comment_nvim")
  return comment_nvim.setup({pre_hook = commentstring.create_pre_hook()})
end
local function _2_(term)
  if (term.direction == "horizontal") then
    return 15
  elseif (term.direction == "vertical") then
    return (0.4 * vim.o.columns)
  else
    return nil
  end
end
local function _4_(t)
  return vim.keymap.set("t", "<ESC>", "<C-\\><C-N>", {buffer = t.bufnr})
end
local function _5_()
  local lf = ((require("toggleterm.terminal")).Terminal):new({cmd = "lf", hidden = true, direction = "float"})
  local function _6_()
    return lf:toggle()
  end
  return {{"<C-\\>"}, {"<leader>tt", "<CMD>ToggleTermToggleAll<CR>", mode = "n", desc = "All terminal"}, {"<leader>n", _6_, desc = "Toggle File Navigator"}}
end
local function _7_()
  vim.o.formatexpr = "v:lua.require'conform'.formatexpr()"
  return nil
end
local function _8_()
  local lint = require("lint")
  lint.linters_by_ft = {javascript = {"eslint_d"}, typescript = {"eslint_d"}, javascriptreact = {"eslint_d"}, typescriptreact = {"eslint_d"}, haskell = {"hlint"}, fennel = {"fennel"}}
  local function _9_()
    return lint.try_lint()
  end
  return vim.api.nvim_create_autocmd({"BufWritePost"}, {callback = _9_})
end
local function _10_()
  vim.o.foldcolumn = "1"
  vim.o.foldlevel = 99
  vim.o.foldlevelstart = 99
  vim.o.foldenable = true
  return nil
end
return {{"TimUntersberger/neogit", cmd = "Neogit", dependencies = {"nvim-lua/plenary.nvim", "sindrets/diffview.nvim"}, keys = {{"<leader>gs", "<CMD>Neogit<CR>", mode = "n"}}, opts = {integrations = {diffview = true}}}, {"windwp/nvim-autopairs", event = "InsertEnter", opts = {check_ts = true}}, {"numToStr/Comment.nvim", event = {"BufReadPost", "BufNewFile"}, dependencies = {"JoosepAlviste/nvim-ts-context-commentstring"}, config = _1_}, {"akinsho/toggleterm.nvim", version = "*", opts = {size = _2_, open_mapping = "<C-\\>", direction = "float", on_create = _4_, winbar = {enabled = true}}, keys = _5_}, {"stevearc/conform.nvim", dependencies = {"mfussenegger/nvim-lint"}, init = _7_, cmd = {"ConformInfo"}, event = {"BufWritePre"}, opts = {formatters_by_ft = {lua = {"stylua"}, fennel = {"fnlfmt"}, haskell = {"fourmolu"}, javascript = {"eslint_d", "eslint", "prettierd", "prettier"}, typescript = {"eslint_d", "eslint", "prettierd", "prettier"}, ocaml = {"ocamlformat"}, python = {formatters = {"isort", "black"}, run_all_formatters = true}, cs = {"csharpier"}, markdown = {}}, format_on_save = {timeout_ms = 500, lsp_fallback = true}}}, {"mfussenegger/nvim-lint", config = _8_}, {"nguyenvukhang/nvim-toggler", opts = {}}, {"kevinhwang91/nvim-ufo", dependencies = {"kevinhwang91/promise-async"}, opts = {}, init = _10_}, {"nvim-pack/nvim-spectre", keys = {{"<leader>S", "<CMD>lua require(\"spectre\").toggle()<CR>", mode = "n"}, {"<leader>sw", "<CMD>lua require(\"spectre\").open_visual({select_word=true})<CR>", mode = "n"}, {"<leader>sw", "<ESC><CMD>lua require(\"spectre\").open_visual()<CR>", mode = "v"}, {"<leader>sp", "<ESC><CMD>lua require(\"spectre\").open_file_search({select_word=true})<CR>", mode = "n"}}}, {"kylechui/nvim-surround", version = "*", event = "VeryLazy", opts = {}}, {"willothy/flatten.nvim", opts = {nest_if_no_args = true, window = {open = "alternate"}}, priority = 1001, lazy = false}}
