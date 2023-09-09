-- Better UI
require("glance").setup({})
require("LspUI").setup({
	prompt = false,
})

require("trouble").setup({})

local lsp = require("lsp-zero").preset({})

require("mason-lspconfig").setup({
	ensure_installed = { "lua_ls", "tsserver", "eslint", "unocss", "zls" },
})

lsp.on_attach(function(_, bufnr)
	-- see :help lsp-zero-keybindings
	-- to learn the available actions
	-- lsp.default_keymaps({ buffer = bufnr })

	local opts = { buffer = bufnr, remap = false }

	vim.keymap.set("n", "<leader>xx", function()
		require("trouble").open()
	end)

	vim.keymap.set("n", "gd", "<cmd>Glance definitions<cr>", opts)
	vim.keymap.set("n", "gt", "<cmd>Glance type_definitions<cr>", opts)
	vim.keymap.set("n", "gr", "<cmd>Glance references<cr>", opts)
	vim.keymap.set("n", "gi", "<cmd>Glance implementations<cr>", opts)
	vim.keymap.set("n", "K", "<cmd>LspUI hover<cr>", opts)
	vim.keymap.set("n", "<leader>vca", "<cmd>LspUI code_action<cr>", opts)
	vim.keymap.set("n", "<leader>vrn", "<cmd>LspUI rename<cr>", opts)
	vim.keymap.set("n", "[d", "<cmd>LspUI diagnostic next<cr>", opts)
	vim.keymap.set("n", "]d", "<cmd>LspUI diagnostic prev<cr>", opts)
	vim.keymap.set("n", "<leader>vd", function()
		vim.diagnostic.open_float()
	end, opts)
	vim.keymap.set("n", "<leader>vws", function()
		vim.lsp.buf.workspace_symbol()
	end, opts)
	vim.keymap.set("n", "<C-h>", function()
		vim.lsp.buf.signature_help()
	end, opts)
end)

-- (Optional) Configure lua language server for neovim
require("lspconfig").lua_ls.setup(lsp.nvim_lua_ls())
require("lspconfig").ocamllsp.setup({})

lsp.setup()

local has_words_before = function()
	unpack = unpack or table.unpack
	local line, col = unpack(vim.api.nvim_win_get_cursor(0))
	return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
end
local luasnip = require("luasnip")

local cmp = require("cmp")
-- local cmp_action = require("lsp-zero").cmp_action()

cmp.setup({
	mapping = {
		["<Tab>"] = cmp.mapping(function(fallback)
			if cmp.visible() then
				cmp.select_next_item()
				-- You could replace the expand_or_jumpable() calls with expand_or_locally_jumpable()
				-- they way you will only jump inside the snippet region
			elseif luasnip.expand_or_jumpable() then
				luasnip.expand_or_jump()
			elseif has_words_before() then
				cmp.complete()
			else
				fallback()
			end
		end, { "i", "s" }),

		["<S-Tab>"] = cmp.mapping(function(fallback)
			if cmp.visible() then
				cmp.select_prev_item()
			elseif luasnip.jumpable(-1) then
				luasnip.jump(-1)
			else
				fallback()
			end
		end, { "i", "s" }),

		["<CR>"] = cmp.mapping({
			i = function(fallback)
				if cmp.visible() and cmp.get_active_entry() then
					cmp.confirm({ behavior = cmp.ConfirmBehavior.Replace, select = false })
				else
					fallback()
				end
			end,
			s = cmp.mapping.confirm({ select = true }),
			c = cmp.mapping.confirm({ behavior = cmp.ConfirmBehavior.Replace, select = true }),
		}),
	},
})
