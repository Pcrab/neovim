require("conform").setup({
	formatters_by_ft = {
		lua = { "stylua" },
		-- Conform will use the first available formatter in the list
		javascript = { "prettier_d", "prettier" },
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
})

require("lint").linters_by_ft = {
	markdown = { "markdownlint" },
	javascript = { "eslint" },
	typescript = { "eslint" },
}

vim.api.nvim_create_autocmd({ "BufWritePost" }, {
	callback = function()
		require("lint").try_lint()
	end,
})

vim.keymap.set("n", "<leader>vf", function()
	require("conform").format({})
end)
