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

return require("packer").startup({
    function(use)
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

        -- Term
        use {
            "numToStr/Fterm.nvim",
            config = function()
                require("config/fterm")
            end
        }

        -- buffer
        use {
            "akinsho/bufferline.nvim",
            requires = "kyazdani42/nvim-web-devicons",
            config = function()
                require("config/nvim-line")
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

        -- Comment
        use {
            "b3nj5m1n/kommentary",
            config = function()
                require("config/comment")
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
            config = function()
                require("config/treesitter")
            end
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

        -- Completion
        require("config/copilot")
        use { "github/copilot.vim", event = "InsertEnter" }

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
    end,
    config = {
        git = { clone_timeout = 120, depth = 1 },
        display = {
            working_sym = '[ ]', error_sym = '[???]', done_sym = '[???]', removed_sym = ' - ', moved_sym = ' ??? ', header_sym = '???',
            open_fn = function() return require("packer.util").float({ border = "rounded" }) end
        }
    }
})
