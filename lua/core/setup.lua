require("lazydev").setup({})

require("mason").setup({})
require("mason-lspconfig").setup({
	ensure_installed = {
		"lua_ls",
		"vimls",
	},
})
require("blink.cmp").setup({})

require("nvim-treesitter.configs").setup({
	ensure_installed = {},
	sync_install = false,
	ignore_install = {},
	auto_install = true,
	modules = {},
})

require("leap").set_default_mappings()

require("conform").setup({
	formatters_by_ft = {
		lua = { "stylua" },
	},
	format_on_save = {
		lsp_format = "fallback",
	},
})

require("gitsigns").setup({
	current_line_blame = true,
	current_line_blame_opts = {
		delay = 0,
	},
})

-- require("vim._extui").enable({})
require("blink.pairs").setup({
	mappings = {
		disabled_filetypes = {},
		enabled = true,
		-- cmdline = true,
	},
	highlights = {
		enabled = true,
		-- cmdline = true,
		groups = {
			"BlinkPairsOrange",
			"BlinkPairsPurple",
			"BlinkPairsBlue",
		},
		-- unmatched_group = "BlinkPairsUnmatched",

		-- highlights matching pairs under the cursor
		matchparen = {
			enabled = true,
			-- known issue where typing won't update matchparen highlight, disabled by default
			-- cmdline = false,
			group = "BlinkPairsMatchParen",
		},
	},
})

require("blink.indent").setup({
	blocked = {
		buftypes = {},
		filetypes = {},
	},
	static = {
		enabled = true,
		char = "▎",
		priority = 1,
		-- specify multiple highlights here for rainbow-style indent guides
		-- highlights = {
		-- 	"BlinkIndentRed",
		-- 	"BlinkIndentOrange",
		-- 	"BlinkIndentYellow",
		-- 	"BlinkIndentGreen",
		-- 	"BlinkIndentViolet",
		-- 	"BlinkIndentCyan",
		-- },
		highlights = { "BlinkIndent" },
	},
	scope = {
		enabled = true,
		char = "▎",
		priority = 1024,
		-- set this to a single highlight, such as 'BlinkIndent' to disable rainbow-style indent guides
		-- highlights = { 'BlinkIndent' },
		highlights = {
			"BlinkIndentOrange",
			"BlinkIndentViolet",
			"BlinkIndentBlue",
			-- 'BlinkIndentRed',
			-- 'BlinkIndentCyan',
			-- 'BlinkIndentYellow',
			-- 'BlinkIndentGreen',
		},
		underline = {
			-- enable to show underlines on the line above the current scope
			enabled = false,
			highlights = {
				"BlinkIndentOrangeUnderline",
				"BlinkIndentVioletUnderline",
				"BlinkIndentBlueUnderline",
				"BlinkIndentRedUnderline",
				"BlinkIndentCyanUnderline",
				"BlinkIndentYellowUnderline",
				"BlinkIndentGreenUnderline",
			},
		},
	},
})
