-- [nfnl] Compiled from fnl/plugins/editor.fnl by https://github.com/Olical/nfnl, do not edit.
local function _1_()
  local comment_nvim = require("Comment")
  local commentstring = require("ts_context_commentstring.integrations.comment_nvim")
  return comment_nvim.setup({pre_hook = commentstring.create_pre_hook()})
end
local function _2_()
  vim.o.formatexpr = "v:lua.require'conform'.formatexpr()"
  return nil
end
local function _3_()
  local lint = require("lint")
  lint.linters_by_ft = {javascript = {"eslint_d"}, typescript = {"eslint_d"}, javascriptreact = {"eslint_d"}, typescriptreact = {"eslint_d"}, fennel = {"fennel"}}
  local function _4_()
    return lint.try_lint()
  end
  return vim.api.nvim_create_autocmd({"BufWritePost"}, {callback = _4_})
end
local function _5_()
  vim.o.foldcolumn = "1"
  vim.o.foldlevel = 99
  vim.o.foldlevelstart = 99
  vim.o.foldenable = true
  return nil
end
return {{"TimUntersberger/neogit", cmd = "Neogit", dependencies = {"nvim-lua/plenary.nvim", "sindrets/diffview.nvim"}, keys = {{"<leader>gs", "<CMD>Neogit<CR>", mode = "n"}}, opts = {integrations = {diffview = true}}}, {"windwp/nvim-autopairs", event = "InsertEnter", opts = {check_ts = true}}, {"numToStr/Comment.nvim", event = {"BufReadPost", "BufNewFile"}, dependencies = {"JoosepAlviste/nvim-ts-context-commentstring"}, config = _1_}, {"akinsho/toggleterm.nvim", version = "*", opts = {open_mapping = "<c-t>", direction = "float"}}, {"akinsho/toggleterm.nvim", version = "*", opts = {open_mapping = "<c-t>", direction = "float"}}, {"stevearc/conform.nvim", dependencies = {"mfussenegger/nvim-lint"}, init = _2_, cmd = {"ConformInfo"}, event = {"BufWritePre"}, opts = {formatters_by_ft = {lua = {"stylua"}, fennel = {"fnlfmt"}, javascript = {"eslint_d", "eslint", "prettierd", "prettier"}, typescript = {"eslint_d", "eslint", "prettierd", "prettier"}, python = {formatters = {"isort", "black"}, run_all_formatters = true}, cs = {"csharpier"}, markdown = {}}, format_on_save = {timeout_ms = 500, lsp_fallback = true}}}, {"mfussenegger/nvim-lint", config = _3_}, {"nguyenvukhang/nvim-toggler", opts = {}}, {"kevinhwang91/nvim-ufo", dependencies = {"kevinhwang91/promise-async"}, opts = {}, init = _5_}}
