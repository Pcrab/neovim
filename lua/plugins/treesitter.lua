return {
    {
        "nvim-treesitter/nvim-treesitter",
        event = { "BufReadPost", "BufNewFile" },
        cmd = { "TSUpdate", "TSUpdateSync" },
        build = ":TSUpdate",
        dependencies = {
            "windwp/nvim-ts-autotag",
            "nvim-treesitter/nvim-treesitter-textobjects",

            "kevinhwang91/nvim-ufo",
        },
        config = function()
            ---@diagnostic disable-next-line: missing-fields
            require("nvim-treesitter.configs").setup({
                ensure_installed = "all",
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
                            -- You can also use captures from other query groups like `locals.scm`
                            ["as"] = { query = "@scope", query_group = "locals", desc = "Select language scope" },
                        },
                    },
                    move = {
                        enable = true,
                        set_jumps = true, -- whether to set jumps in the jumplist
                        goto_next_start = {
                            ["]f"] = "@function.outer",
                            ["]c"] = "@class.outer",
                        },
                        goto_next_end = {
                            ["]F"] = "@function.outer",
                            ["]C"] = "@class.outer",
                        },
                        goto_previous_start = {
                            ["[f"] = "@function.outer",
                            ["[c"] = "@class.outer",
                        },
                        goto_previous_end = {
                            ["[F"] = "@function.outer",
                            ["[C"] = "@class.outer",
                        },
                    },
                },
                highlight = {
                    enable = true,
                    highlight = {
                        enable = true,
                        disable = function(lang, bufnr)
                            if lang == "html" and vim.api.nvim_buf_line_count(bufnr) > 500 then
                                return true
                            end
                            for _, line in ipairs(vim.api.nvim_buf_get_lines(0, 0, 3, false)) do
                                if #line > 500 then
                                    return true
                                end
                            end
                            return false
                        end,
                    },
                },
                autotag = {
                    enable = true,
                    enable_rename = true,
                    enable_close = true,
                    enable_close_on_slash = true,
                },
            })
        end,
    },
}
