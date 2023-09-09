return {
	"nvim-telescope/telescope.nvim",
	branch = "0.1.x",
	dependencies = {
		{ "nvim-lua/plenary.nvim" },
		{ "paopaol/telescope-git-diffs.nvim" },
		{ "nvim-telescope/telescope-fzy-native.nvim" },
		{ "nvim-telescope/telescope-live-grep-args.nvim" },
		{ "benfowler/telescope-luasnip.nvim" },
		{ "nvim-telescope/telescope-dap.nvim" },
	},
	cmd = {
		"Telescope",
	},
	config = function()
		local telescope = require("telescope")
		local lga_actions = require("telescope-live-grep-args.actions")

		telescope.setup({
			extensions = {
				fzy_native = {
					override_generic_sorter = false,
					override_file_sorter = true,
				},
				live_grep_args = {
					auto_quoting = true, -- enable/disable auto-quoting
					-- define mappings, e.g.
					mappings = { -- extend mappings
						i = {
							["<C-k>"] = lga_actions.quote_prompt(),
							["<C-i>"] = lga_actions.quote_prompt({ postfix = " --iglob " }),
						},
					},
					-- ... also accepts theme settings, for example:
					-- theme = "dropdown", -- use dropdown theme
					-- theme = { }, -- use own theme spec
					-- layout_config = { mirror=true }, -- mirror preview pane
				},
			},
		})

		local extensions = {
			"dap",
			"fzy_native",
			"git_diffs",
			"live_grep_args",
			"luasnip",
		}

		for _, ext in ipairs(extensions) do
			local ok = pcall(telescope.load_extension, ext)
			if not ok then
				vim.print("Failed to load telescope extension: " .. ext)
			end
		end
	end,
	keys = {
		{
			"<leader>ff",
			function()
				require("telescope.builtin").find_files()
			end,
			desc = "Find files",
		},
		{
			"<leader>f?",
			function()
				require("telescope.builtin").help_tags()
			end,
			desc = "Help tags",
		},
		{
			"<leader>fg",
			function()
				require("telescope").extensions.live_grep_args.live_grep_args()
			end,
			desc = "Live grep",
		},
	},
}
