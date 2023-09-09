return {
	"williamboman/mason-lspconfig.nvim",
	dependencies = {
		"williamboman/mason.nvim",
		"neovim/nvim-lspconfig",
		"b0o/SchemaStore.nvim",
	},
	config = function()
		local lspconfig = require("lspconfig")

		local capabilities = require("core.capabilities")

		require("mason").setup()
		require("mason-lspconfig").setup({
			handlers = {
				function(server)
					lspconfig[server].setup({ capabilities = capabilities })
				end,

				tsserver = function() end,
				unocss = function() end,

				lua_ls = function()
					lspconfig.lua_ls.setup({
						on_attach = function(client, bufnr)
							client.server_capabilities.documentFormattingProvider = false
						end,
						capabilities = capabilities,
						settings = {
							Lua = {
								hint = {
									enable = true,
									setType = true,
								},
								codelens = {
									enable = true,
								},
								completion = {
									callSnippet = "Replace",
									postfix = ".",
									showWord = "Disable",
									workspaceWord = false,
								},
							},
						},
					})
				end,

				jsonls = function()
					lspconfig.jsonls.setup({
						settings = {
							json = {
								schemas = require("schemastore").json.schemas(),
								validate = { enable = true },
							},
						},
						on_attach = function(client, bufnr)
							client.server_capabilities.documentFormattingProvider = false
						end,
						capabilities = capabilities,
					})
				end,

				yamlls = function()
					lspconfig.yamlls.setup({
						capabilities = capabilities.capabilities,
						settings = {
							yaml = {
								keyOrdering = false,
								schemaStore = {
									enable = false,
									url = "",
								},
								schemas = require("schemastore").yaml.schemas(),
							},
						},
					})
				end,
			},
		})

		-- Set diagnostic options
		vim.diagnostic.config({
			virtual_text = {
				spacing = 4,
				prefix = "●",
				severity = vim.diagnostic.severity.ERROR,
			},
			float = {
				severity_sort = true,
				source = "if_many",
			},
			severity_sort = true,
		})

		vim.api.nvim_create_autocmd("LspAttach", {
			desc = "General LSP Attach",
			callback = function(args)
				local bufnr = args.buf
				local client = vim.lsp.get_client_by_id(args.data.client_id)

				-- Setup keymaps
				vim.keymap.set("n", "K", vim.lsp.buf.hover, { buffer = bufnr, desc = "LSP: Hover" })
				vim.keymap.set(
					{ "n", "i" },
					"<C-k>",
					vim.lsp.buf.signature_help,
					{ buffer = bufnr, desc = "LSP: Signature help" }
				)

				vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, { buffer = bufnr, desc = "Diagnostic" })
				vim.keymap.set("n", "]d", vim.diagnostic.goto_next, { buffer = bufnr, desc = "Diagnostic" })

				vim.keymap.set("n", "gd", vim.lsp.buf.definition, { buffer = bufnr, desc = "Definition" })
				vim.keymap.set("n", "gD", vim.lsp.buf.declaration, { buffer = bufnr, desc = "Declaration" })
				vim.keymap.set("n", "gI", vim.lsp.buf.implementation, { buffer = bufnr, desc = "Implementation" })
				vim.keymap.set("n", "gr", function()
					vim.lsp.buf.references({ include_declaration = false })
				end, { buffer = bufnr, desc = "References" })

				vim.keymap.set("n", "<leader>ln", vim.lsp.buf.rename, { buffer = bufnr, desc = "Rename" })
				vim.keymap.set(
					{ "n", "v" },
					"<leader>la",
					vim.lsp.buf.code_action,
					{ buffer = bufnr, desc = "Code action" }
				)
				vim.keymap.set(
					"n",
					"<leader>ll",
					vim.diagnostic.setloclist,
					{ buffer = bufnr, desc = "Diagnostic list" }
				)
				vim.keymap.set(
					"n",
					"<leader>ld",
					vim.diagnostic.open_float,
					{ buffer = bufnr, desc = "Diagnostic float" }
				)

				-- Use conform instead
				-- vim.keymap.set("n", "<leader>F", function()
				--   vim.lsp.buf.format { async = true }
				-- end, { buffer = bufnr, desc = "Format document" })

				vim.keymap.set(
					"n",
					"<leader>lwa",
					vim.lsp.buf.add_workspace_folder,
					{ buffer = bufnr, desc = "Add workspace folder" }
				)
				vim.keymap.set(
					"n",
					"<leader>lwr",
					vim.lsp.buf.remove_workspace_folder,
					{ buffer = bufnr, desc = "Remove workspace folder" }
				)
				vim.keymap.set("n", "<leader>lwl", function()
					print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
				end, { buffer = bufnr, desc = "List workspace folders" })
				-- Enable inlay hints
				if client and client.server_capabilities.inlayHintProvider then
					vim.lsp.inlay_hint(bufnr, true)
				end
			end,
		})
	end,
}
