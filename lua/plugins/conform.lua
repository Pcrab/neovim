return {
	"stevearc/conform.nvim",
	dependencies = {
		"mfussenegger/nvim-lint",
	},
	opts = {
		formatters_by_ft = {
			lua = { "stylua" },
			-- Conform will use the first available formatter in the list
			javascript = { "prettier_d", "prettier" },
			typescript = { "prettier_d", "prettier" },
			-- Formatters can also be specified with additional options
			python = {
				formatters = { "isort", "black" },
				-- Run formatters one after another instead of stopping at the first success
				run_all_formatters = true,
			},
			ocaml = {
				formatters = { "ocamlformat" },
			},
		},
		format_on_save = {
			-- These options will be passed to conform.format()
			timeout_ms = 500,
			lsp_fallback = true,
		},
	},
	lazy = false,
	config = function()
		vim.api.nvim_create_autocmd("BufWritePre", {
			pattern = "*",
			callback = function(args)
				-- Disable autoformat on certain filetypes
				local ignore_filetypes = { "sql", "java" }
				if vim.tbl_contains(ignore_filetypes, vim.bo[args.buf].filetype) then
					return
				end
				-- Disable with a global or buffer-local variable
				if vim.g.disable_autoformat or vim.b[args.buf].disable_autoformat then
					return
				end
				-- Disable autoformat for files in a certain path
				local bufname = vim.api.nvim_buf_get_name(args.buf)
				if bufname:match("/node_modules/") then
					return
				end
				require("conform").format({ timeout_ms = 500, lsp_fallback = true, bufnr = args.buf })
			end,
		})
	end,
	keys = {
		{

			"<leader>vf",
			function()
				require("conform").format({})
			end,
			desc = "Format",
		},
	},
}
