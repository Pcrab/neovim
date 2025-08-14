require("lazydev").setup({})

require("mason").setup({})
require("mason-lspconfig").setup({
	ensure_installed = {
		"emmylua_ls",
		"vimls",
		"fennel_language_server",
		"elixirls",
		"html",
		"vtsls",
	},
})
require("blink.cmp").setup({})

require("nvim-treesitter.configs").setup({
	ensure_installed = {},
	sync_install = false,
	ignore_install = {},
	auto_install = true,
	modules = {},
	highlight = {
		enable = true,
	},
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

require("todo-comments").setup({})

require("copilot").setup({
	suggestion = {
		auto_trigger = true,
		keymap = {
			accept = false,
		},
	},
})
vim.keymap.set("i", "<Tab>", function()
	if require("copilot.suggestion").is_visible() then
		require("copilot.suggestion").accept()
	else
		vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes("<Tab>", true, false, true), "n", false)
	end
end, { desc = "Super Tab" })
require("codecompanion").setup({
	strategies = {
		chat = {
			adapter = "copilot",
		},
		inline = {
			adapter = "copilot",
		},
		cmd = {
			adapter = "copilot",
		},
	},
	opts = {},
	adapters = {
		deepseek = function()
			return require("codecompanion.adapters").extend("anthropic", {
				env = {
					api_key = "cmd: gpg --batch --quiet --decrypt ~/.cache/secrets/deepseek.gpg",
				},
			})
		end,
	},
})
