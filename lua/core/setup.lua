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
