-- [nfnl] Compiled from fnl/plugins/ui.fnl by https://github.com/Olical/nfnl, do not edit.
return {{"stevearc/dressing.nvim", event = "VeryLazy", opts = {input = {win_options = {winblend = 0}}}}, {"kevinhwang91/nvim-bqf", ft = "qf"}, {"lewis6991/gitsigns.nvim", opts = {signs = {add = {text = "\226\148\130"}, change = {text = "\226\148\130"}, delete = {text = "_"}, topdelete = {text = "\226\128\190"}, changedelete = {text = "~"}, untracked = {text = "\226\148\134"}}, signcolumn = true, numhl = true, watch_gitdir = {follow_files = true}, attach_to_untracked = true, current_line_blame = true, current_line_blame_opts = {virt_text = true, virt_text_pos = "eol", delay = 0, ignore_whitespace = false}, current_line_blame_formatter = "<author>, <author_time:%Y-%m-%d> - <summary>", sign_priority = 6, update_debounce = 100, status_formatter = nil, max_file_length = 40000, preview_config = {border = "single", style = "minimal", relative = "cursor", row = 0, col = 1}, yadm = {enable = false}, word_diff = false, linehl = false}}, {"kevinhwang91/nvim-hlslens", keys = {{"n", "<Cmd>execute('normal! ' . v:count1 . 'n')<CR><Cmd>lua require('hlslens').start()<CR>", mode = {"n"}, desc = "hlslens"}, {"N", "<Cmd>execute('normal! ' . v:count1 . 'N')<CR><Cmd>lua require('hlslens').start()<CR>", mode = {"n"}, desc = "hlslens"}, {"*", "*<Cmd>lua require('hlslens').start()<CR>", mode = {"n"}, desc = "hlslens"}, {"#", "#<Cmd>lua require('hlslens').start()<CR>", mode = {"n"}, desc = "hlslens"}, {"g*", "g*<Cmd>lua require('hlslens').start()<CR>", mode = {"n"}, desc = "hlslens"}, {"g#", "g#<Cmd>lua require('hlslens').start()<CR>", mode = {"n"}, desc = "hlslens"}, {"<BS>", "<Cmd>noh<CR>", mode = {"n"}, desc = "noh"}}, opts = {}, lazy = false}}
