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
		event = "VeryLazy",
		config = function()
			require("plugins.search")
		end,
	},
	{
		"sainnhe/everforest",
		lazy = false,
		priority = 1000,
	},
	{
		"nvim-treesitter/nvim-treesitter",
		build = ":TSUpdate",
		config = function()
			require("plugins.treesitter")
		end,
		dependencies = {
			"nvim-treesitter/nvim-treesitter-context",
			"nvim-treesitter/nvim-treesitter-textobjects",
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

			{ "dnlhc/glance.nvim" },
			{ "jinzhongjia/LspUI.nvim", branch = "legacy" },

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
		keys = {
			{ "<leader>vso", mode = { "n" }, "<cmd>SymbolsOutlineOpen<cr>" },
		},
		config = function()
			require("plugins.outline")
		end,
	},
	{
		"NeogitOrg/neogit",
		dependencies = {
			{ "lewis6991/gitsigns.nvim" },
			"nvim-lua/plenary.nvim",
			"sindrets/diffview.nvim",
			"ibhagwan/fzf-lua",
		},
		opts = {},
		keys = {
			{ "<leader>gs", mode = { "n" }, "<cmd>Neogit<cr>" },
		},
	},
	{
		"lewis6991/gitsigns.nvim",
		config = function()
			require("plugins.git")
		end,
	},
	{
		"folke/flash.nvim",
		event = "VeryLazy",
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
		opts = {
			window = {
				position = "left",
			},
		},
		keys = {
			{ "<leader>tt", mode = { "n" }, "<cmd>Neotree toggle<cr>" },
			{ "<leader>tg", mode = { "n" }, "<cmd>Neotree source=git_status reveal=true toggle<cr>" },
			{ "<leader>tr", mode = { "n" }, "<cmd>Neotree reveal=true toggle<cr>" },
		},
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
		dependencies = { "nvim-lua/plenary.nvim" },
		ft = { "norg" },
		config = function()
			require("plugins.neorg")
		end,
	},
	{
		"stevearc/oil.nvim",
		dependencies = { "nvim-tree/nvim-web-devicons" },
		event = "VeryLazy",
		config = function()
			require("plugins.oil")
		end,
	},
	{
		"akinsho/toggleterm.nvim",
		version = "*",
		opts = {
			direction = "float",
		},
		keys = {
			{ "<C-\\>", mode = { "n", "t", "i" }, "<cmd>ToggleTerm<cr>" },
		},
	},
	{
		"numToStr/Comment.nvim",
		config = function()
			require("plugins.comment")
		end,
	},
	{
		"kevinhwang91/nvim-fundo",
		dependencies = {
			"mbbill/undotree",
			"kevinhwang91/promise-async",
		},
		build = function()
			require("fundo").install()
		end,
		config = function()
			require("plugins.undo")
		end,
	},
	{
		"lukas-reineke/indent-blankline.nvim",
		config = function()
			require("plugins.indent")
		end,
	},
	{
		"nvim-lualine/lualine.nvim",
		dependencies = {
			"nvim-tree/nvim-web-devicons",
		},
		config = function()
			require("plugins.lualine")
		end,
	},
})
