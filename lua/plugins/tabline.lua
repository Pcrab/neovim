return {
    {
        "nanozuki/tabby.nvim",
        lazy = false,
        config = function()
            local values = require("core.values")

            local function make_theme()
                local theme = values.theme
                local palette = values.theme.palette
                if theme.name == "rose-pine" then
                    return {
                        line = { fg = palette.text, bg = palette.surface },
                        head = { fg = palette.surface, bg = palette.iris, style = "italic" },
                        current_tab = { fg = palette.surface, bg = palette.rose, style = "bold" },
                        tab = { fg = palette.text, bg = palette.overlay, style = "bold" },
                        win = { fg = palette.text, bg = palette.overlay },
                        tail = { fg = palette.surface, bg = palette.rose, style = "bold" },
                    }
                end
            end

            local theme = make_theme()
            vim.opt.showtabline = 2
            require("tabby.tabline").set(function(line)
                local cwd = " " .. vim.fn.fnamemodify(vim.fn.getcwd(), ":t") .. " "
                return {
                    { { cwd, hl = theme.head }, line.sep("", theme.head, theme.line) },
                    line.tabs().foreach(function(tab)
                        local hl = tab.is_current() and theme.current_tab or theme.tab
                        return {
                            line.sep("", hl, theme.line),
                            tab.is_current() and "󰆤" or "󰆣",
                            string.format("%s:", tab.number()),
                            tab.name(),
                            line.sep("", hl, theme.line),
                            margin = " ",
                            hl = hl,
                        }
                    end),
                    line.spacer(),
                    line.wins_in_tab(line.api.get_current_tab()).foreach(function(win)
                        return {
                            line.sep("", theme.win, theme.line),
                            win.is_current() and "" or "",
                            win.buf_name(),
                            line.sep("", theme.win, theme.line),
                            margin = " ",
                            hl = theme.win,
                        }
                    end),
                    { line.sep("", theme.tail, theme.line), { "  ", hl = theme.tail } },
                    hl = theme.line,
                }
            end, {})
        end,
        keys = {
            { "<Tab>", "<CMD>tabnext<CR>", desc = "Next tab" },
            { "<S-Tab>", "<CMD>tabprev<CR>", desc = "Prev tab" },

            { "<leader>tc", "<CMD>$tabnew<CR>", desc = "Create new tab" },
            { "<leader>to", "<CMD>tabonly<CR>", desc = "Close other tabs" },
            { "<leader>tx", "<CMD>tabclose<CR>", desc = "Pick tab to close" },

            { "<leader>tmn", "<CMD>+tabmove<CR>", desc = "Move current tab to next" },
            { "<leader>tmp", "<CMD>-tabmove<CR>", desc = "Move current tab to prev" },
        },
    },
}
