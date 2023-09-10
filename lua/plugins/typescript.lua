return {
	"pmizio/typescript-tools.nvim",
	event = {
		"BufRead *.js,*.jsx,*.mjs,*.cjs,*ts,*tsx",
		"BufNewFile *.js,*.jsx,*.mjs,*.cjs,*ts,*tsx",
	},
	dependencies = {
		"nvim-lua/plenary.nvim",
		"neovim/nvim-lspconfig",
	},
	opts = {
		on_attach = function(client, bufnr)
			client.server_capabilities.documentFormattingProvider = false
			client.server_capabilities.documentRangeFormattingProvider = false

			vim.keymap.set(
				"n",
				"gD",
				"<Cmd>TSToolsGoToSourceDefinition<CR>",
				{ buffer = bufnr, desc = "Source Definition" }
			)
		end,
		settings = {
			tsserver_file_preferences = {
				includeInlayParameterNameHints = "all",
				includeInlayParameterNameHintsWhenArgumentMatchesName = false,
				includeInlayFunctionParameterTypeHints = true,
				includeInlayVariableTypeHints = true,
				includeInlayPropertyDeclarationTypeHints = true,
				includeInlayFunctionLikeReturnTypeHints = true,
				includeInlayEnumMemberValueHints = true,
			},
		},
	},
}
