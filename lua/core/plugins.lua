local glob = require("glob")
local ensure_packer = function()
    local fn = glob.fn
    local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
    if fn.empty(fn.glob(install_path)) > 0 then
        fn.system({ "git", "clone", "--depth", "1", "https://github.com/wbthomason/packer.nvim", install_path })
        glob.cmd [[packadd packer.nvim]]
        return true
    end
    return false
end

local packer_bootstrap = ensure_packer()

return require("packer").startup(function(use)
    -- Packer self management
    use "wbthomason/packer.nvim"

    -- Optimize startup time
    use {
        "dstein64/vim-startuptime",
        "lewis6991/impatient.nvim",
    }

    --
    -- Operations
    --

    -- surround
    use {
        "kylechui/nvim-surround",
        config = function ()
            require("nvim-surround").setup({})
        end,
    }

    -- buffer
    use {
        "akinsho/bufferline.nvim",
        requires = "kyazdani42/nvim-web-devicons",
        config = function()
            require("config/bufferline")
        end
    }
    -- file
    use {
        "kyazdani42/nvim-tree.lua",
        requires = "kyazdani42/nvim-web-devicons",
        tag = "nightly",
        config = function()
            require("config/file")
        end
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
    require("config/coc").config()
    use {
        "neoclide/coc.nvim",
        branch = "release",
        config = function()
            require("config/coc").setup()
        end
    }

    -- Specific Language
    use {
        "simrat39/rust-tools.nvim"
    }

    --
    -- GUI
    --
    use { "ellisonleao/gruvbox.nvim" }
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
