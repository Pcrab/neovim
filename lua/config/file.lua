local glob = require("glob")

local lib = require("nvim-tree.lib")
local view = require("nvim-tree.view")

local function collapse_all()
    require("nvim-tree.actions.tree-modifiers.collapse-all").fn()
end

local function edit_or_open()
    -- open as vsplit on current node
    local action = "edit"
    local node = lib.get_node_at_cursor()

    -- Just copy what's done normally with vsplit
    if node.link_to and not node.nodes then
        require('nvim-tree.actions.node.open-file').fn(action, node.link_to)
        view.close() -- Close the tree if file was opened

    elseif node.nodes ~= nil then
        lib.expand_or_collapse(node)

    else
        require('nvim-tree.actions.node.open-file').fn(action, node.absolute_path)
        view.close() -- Close the tree if file was opened
    end

end

local function vsplit_preview()
    -- open as vsplit on current node
    local action = "vsplit"
    local node = lib.get_node_at_cursor()

    -- Just copy what's done normally with vsplit
    if node.link_to and not node.nodes then
        require('nvim-tree.actions.node.open-file').fn(action, node.link_to)

    elseif node.nodes ~= nil then
        lib.expand_or_collapse(node)

    else
        require('nvim-tree.actions.node.open-file').fn(action, node.absolute_path)

    end

    -- Finally refocus on tree if it was lost
    view.focus()
end

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
        enable = true,
        show_on_dirs = true,
        debounce_delay = 100,
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
    view                 = {
        mappings = {
            custom_only = false,
            list = {
                { key = "l", action = "edit", action_cb = edit_or_open },
                { key = "L", action = "vsplit_preview", action_cb = vsplit_preview },
                { key = "h", action = "close_node" },
                { key = "H", action = "collapse_all", action_cb = collapse_all }
            }
        },
        float = {
            enable = true,
            open_win_config = function()
                local columns = glob.o.columns
                local lines = glob.o.lines
                local width = math.max(math.floor(columns * 0.5), 50)
                local height = math.max(math.floor(lines * 0.5), 20)
                local left = math.ceil((columns - width) * 0.5)
                local top = math.ceil((lines - height) * 0.5 - 2)
                return { relative = "editor", border = "rounded", width = width, height = height, row = top, col = left }
            end,
        }
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
