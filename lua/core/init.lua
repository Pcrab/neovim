local glob = require("glob")

-- basics
glob.cmd("syntax on")
glob.cmd("filetype plugin indent on")

-- Clipboard
-- WSL user should install https://github.com/equalsraf/win32yank
glob.opt.clipboard = "unnamedplus"

-- Search
glob.opt.hlsearch   = true
glob.opt.showmatch  = true
glob.opt.incsearch  = true
glob.opt.smartcase  = true
glob.opt.timeoutlen = 400

glob.opt.number         = true
glob.opt.relativenumber = true
glob.opt.shiftround     = true
glob.opt.updatetime     = 100
glob.opt.cursorline     = true
glob.opt.signcolumn     = "yes"

if (glob.fn.has("termguicolors") == 1) then
	glob.opt.termguicolors = true
end

-- tabs
glob.opt.autoindent  = true
glob.opt.tabstop     = 4
glob.opt.shiftwidth  = 4
glob.opt.softtabstop = 4
glob.opt.mouse       = "a"
glob.opt.expandtab   = true
glob.opt.autowrite   = false
glob.opt.formatoptions = ""

require("core.plugins")

glob.g.loaded_matchparen        = 1
glob.g.loaded_matchit           = 1
glob.g.loaded_logiPat           = 1
glob.g.loaded_rrhelper          = 1
glob.g.loaded_tarPlugin         = 1
glob.g.loaded_gzip              = 1
glob.g.loaded_zipPlugin         = 1
glob.g.loaded_2html_plugin      = 1
glob.g.loaded_shada_plugin      = 1
glob.g.loaded_spellfile_plugin  = 1
glob.g.loaded_netrw             = 1
glob.g.loaded_netrwPlugin       = 1
glob.g.loaded_tutor_mode_plugin = 1
glob.g.loaded_remote_plugins    = 1

require("core.gui")
require("core.keymaps")
