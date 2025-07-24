vim.pack.add({
	{ src = "https://github.com/mason-org/mason.nvim" },
	{ src = "https://github.com/mason-org/mason-lspconfig.nvim" },
	{ src = "https://github.com/neovim/nvim-lspconfig" },
	{ src = "https://github.com/nvim-treesitter/nvim-treesitter" },

	{
		src = "https://github.com/Saghen/blink.cmp",
		version = vim.version.range("1"),
	},

	{ src = "https://github.com/folke/lazydev.nvim" },

	{ src = "https://github.com/RRethy/vim-illuminate" },

	{ src = "https://github.com/nvim-tree/nvim-web-devicons" },

	-- LEAP repeat.vim for dot-repeats (.) to work
	{ src = "https://github.com/ggandor/leap.nvim" },
	{ src = "https://github.com/tpope/vim-repeat" },

	{ src = "https://github.com/stevearc/conform.nvim" },

	-- GIT
	{ src = "https://github.com/lewis6991/gitsigns.nvim" },
	{ src = "https://github.com/tpope/vim-fugitive" },

	-- blink.download prebuilt binaries from gh release
	{ src = "https://github.com/saghen/blink.pairs", version = "v0.3.0" },
	{ src = "https://github.com/saghen/blink.download" },

	{ src = "https://github.com/saghen/blink.indent" },

	{ src = "https://github.com/ibhagwan/fzf-lua" },

	{ src = "https://github.com/folke/todo-comments.nvim" },
	{ src = "https://github.com/nvim-lua/plenary.nvim" },
})
