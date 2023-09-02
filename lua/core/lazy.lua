local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable", -- latest stable release
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
	{
		"ibhagwan/fzf-lua",
		-- optional for icon support
		dependencies = { "nvim-tree/nvim-web-devicons" },
		config = function()
			require("plugins.search")
		end,
	},
	{
		"sainnhe/everforest",
	},
	{
		"nvim-treesitter/nvim-treesitter",
		build = ":TSUpdate",
		config = function()
			require("plugins.treesitter")
		end,
		dependencies = {
			"nvim-treesitter/nvim-treesitter-context",
			"RRethy/nvim-treesitter-textsubjects",
			"windwp/nvim-ts-autotag",
		},
	},
	{
		"VonHeikemen/lsp-zero.nvim",
		branch = "v2.x",
		dependencies = {
			-- LSP Support
			{ "neovim/nvim-lspconfig" },
			{ "williamboman/mason.nvim" },
			{ "williamboman/mason-lspconfig.nvim" },

			-- Autocompletion
			{ "hrsh7th/nvim-cmp" },
			{ "hrsh7th/cmp-nvim-lsp" },
			{ "L3MON4D3/LuaSnip" },
		},
		config = function()
			require("plugins.lsp")
		end,
	},
	{
		"simrat39/symbols-outline.nvim",
		config = function()
			require("plugins.outline")
		end,
	},
	{
		"NeogitOrg/neogit",
		dependencies = {
			"lewis6991/gitsigns.nvim",
			"nvim-lua/plenary.nvim", -- required
			"sindrets/diffview.nvim", -- optional
			"ibhagwan/fzf-lua", -- optional
		},
		config = function()
			require("plugins.git")
		end,
	},
	{
		"folke/flash.nvim",
		config = function()
			require("plugins.flash")
		end,
	},
	{
		"nvim-neo-tree/neo-tree.nvim",
		branch = "v3.x",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
			"MunifTanjim/nui.nvim",
		},
		config = function()
			require("plugins.neo-tree")
		end,
	},
	{
		"stevearc/conform.nvim",
		dependencies = {
			"mfussenegger/nvim-lint",
		},
		config = function()
			require("plugins.format")
		end,
	},
	{
		"windwp/nvim-autopairs",
		event = "InsertEnter",
		config = function()
			require("plugins.autopair")
		end,
	},
	{
		"kevinhwang91/nvim-bqf",
		dependencies = {
			{
				"junegunn/fzf",
				build = function()
					vim.fn["fzf#install"]()
				end,
			},
		},
	},
	{
		"nvim-neorg/neorg",
		build = ":Neorg sync-parsers",
		dependencies = { "nvim-lua/plenary.nvim" },
		config = function()
			require("plugins.neorg")
		end,
	},
})
