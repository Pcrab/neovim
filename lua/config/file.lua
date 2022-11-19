require("nvim-tree").setup({
    disable_netrw        = true,
    hijack_netrw         = true,
    open_on_setup        = true,
    ignore_ft_on_setup   = {},
    auto_reload_on_write = true,
    open_on_tab          = false,
    hijack_cursor        = false,
    update_cwd           = false,
    diagnostics          = {
        enable = false,
        icons = {
            hint = "",
            info = "",
            warning = "",
            error = "",
        }
    },
    update_focused_file  = {
        enable      = true,
        update_cwd  = true,
        ignore_list = {}
    },
    system_open          = {
        cmd  = nil,
        args = {}
    },
    filters              = {
        custom = {
            "^.git$"
        }
    },
    git                  = {
        enable = true,
        ignore = true,
        timeout = 500,
    },
    view                 = {
        width = 30,
        hide_root_folder = false,
        side = 'left',
        mappings = {
            custom_only = false,
            list = {}
        },
        number = false,
        relativenumber = false,
        signcolumn = "yes"
    },
    trash                = {
        cmd = "trash",
        require_confirm = true
    },
    actions              = {
        change_dir = {
            global = false,
        },
        open_file = {
            quit_on_open = false,
        }
    }
})
-- vim.api.nvim_create_autocmd("BufEnter", {
--   group = vim.api.nvim_create_augroup("NvimTreeClose", {clear = true}),
--   pattern = "NvimTree_*",
--   callback = function()
--     local layout = vim.api.nvim_call_function("winlayout", {})
--     if layout[1] == "leaf" and vim.api.nvim_buf_get_option(vim.api.nvim_win_get_buf(layout[2]), "filetype") == "NvimTree" and layout[3] == nil then vim.cmd("confirm quit") end
--   end
-- })
