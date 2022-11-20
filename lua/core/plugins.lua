local ensure_packer = function()
    local fn = vim.fn
    local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
    if fn.empty(fn.glob(install_path)) > 0 then
        fn.system({ "git", "clone", "--depth", "1", "https://github.com/wbthomason/packer.nvim", install_path })
        vim.cmd [[packadd packer.nvim]]
        return true
    end
    return false
end

local packer_bootstrap = ensure_packer()

return require("packer").startup(function(use)
    use "wbthomason/packer.nvim"

    -- Begin define custom plugins

    -- Optimize startup time
    use {
        "dstein64/vim-startuptime",
        "lewis6991/impatient.nvim",
        "nathom/filetype.nvim"
    }

    --
    -- Operations
    --

    -- buffer
    use {
        "akinsho/bufferline.nvim",
        requires = "kyazdani42/nvim-web-devicons"
    }
    use "moll/vim-bbye"
    -- file
    use {
        "kyazdani42/nvim-tree.lua",
        requires = "kyazdani42/nvim-web-devicons"
    }
    -- git
    use {
        "lewis6991/gitsigns.nvim",
        tag = "release",
    }

    -- telescope
    use {
        "nvim-telescope/telescope.nvim",
        requires = "nvim-lua/plenary.nvim"
    }

    --
    -- Language
    --

    use {
        "nvim-treesitter/nvim-treesitter",
        run = function()
            local ts_update = require("nvim-treesitter.install").update({ with_sync = true })
            ts_update()
        end,
    }

    -- LSP
    use {
        "williamboman/mason.nvim",
        "williamboman/mason-lspconfig.nvim",
        "neovim/nvim-lspconfig",
    }
    use {
        "glepnir/lspsaga.nvim",
        branch = "main"
    }
    -- CMP
    use {
        "hrsh7th/cmp-nvim-lsp",
        "hrsh7th/cmp-buffer",
        "hrsh7th/cmp-path",
        "hrsh7th/cmp-cmdline",
        "hrsh7th/nvim-cmp",

        "L3MON4D3/LuaSnip",
        "saadparwaiz1/cmp_luasnip",
    }
    -- Specific Language
    use {
        "simrat39/rust-tools.nvim"
    }

    --
    -- GUI
    --
    use {
        "EdenEast/nightfox.nvim",
        config = function()
            vim.cmd("colorscheme nightfox")
        end
    }
    use {
        "goolord/alpha-nvim",
        config = function()
            require("alpha").setup(require "alpha.themes.dashboard".config)
        end
    }
    use {
        "nvim-lualine/lualine.nvim",
        requires = "kyazdani42/nvim-web-devicons"
    }
    use("lukas-reineke/indent-blankline.nvim")

    -- End of custom plugins

    -- Automatically set up your configuration after cloning packer.nvim
    -- Put this at the end after all plugins
    if packer_bootstrap then
        require("packer").sync()
    end
end)
