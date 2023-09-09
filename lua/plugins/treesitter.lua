return {
	"nvim-treesitter/nvim-treesitter",
	event = "VeryLazy",
	dependencies = {
		{ "JoosepAlviste/nvim-ts-context-commentstring" },
		{ "RRethy/nvim-treesitter-endwise" },

		{
			"nvim-treesitter/nvim-treesitter-context",
			event = "VeryLazy",
			opts = {
				mode = "topline",
			},
			keys = {
				{ "<leader>tc", "<Cmd>TSContextToggle<CR>", desc = "Treesitter Context" },
			},
		},
		{ "nvim-treesitter/nvim-treesitter-textobjects" },
		{ "RRethy/nvim-treesitter-textsubjects" },
		{ "windwp/nvim-ts-autotag" },
	},
	build = ":TSUpdate",
	config = function()
		if vim.loop.os_uname().sysname == "win32" then
			require("nvim-treesitter.install").prefer_git = false
		end

		require("nvim-treesitter.configs").setup({
			ensure_installed = "all",

			auto_install = true,

			highlight = {
				enable = true,
				additional_vim_regex_highlighting = false,
			},
			indent = {
				enable = true,
			},
			autotag = {
				enable = true,
			},
			endwise = {
				enable = true,
			},
			context_commentstring = {
				enable = true,
			},

			textobjects = {
				select = {
					enable = true,
					lookahead = true,
					keymaps = {
						-- You can use the capture groups defined in textobjects.scm
						["af"] = "@function.outer",
						["if"] = "@function.inner",
						["ac"] = "@class.outer",
						-- You can optionally set descriptions to the mappings (used in the desc parameter of
						-- nvim_buf_set_keymap) which plugins like which-key display
						["ic"] = { query = "@class.inner", desc = "Select inner part of a class region" },
					},
					selection_modes = {
						["@parameter.outer"] = "v", -- charwise
						["@function.outer"] = "V", -- linewise
						["@class.outer"] = "<c-v>", -- blockwise
					},
					include_surrounding_whitespace = true,
				},
			},
			textsubjects = {
				enable = true,
				prev_selection = ",", -- (Optional) keymap to select the previous selection
				keymaps = {
					["."] = "textsubjects-smart",
					[";"] = "textsubjects-container-outer",
					["i;"] = "textsubjects-container-inner",
				},
			},
		})
	end,
}
