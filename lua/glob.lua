local glob = {}

glob.api = vim.api
glob.b = vim.b
glob.cmd = vim.cmd
glob.fn = vim.fn
glob.g = vim.g
glob.o = vim.o
glob.opt = vim.opt

function glob.map(maps)
    for _,map in pairs(maps) do
        glob.api.nvim_set_keymap(map[1], map[2], map[3], map[4])
    end
end

function glob.exec(c)
    glob.api.nvim_exec(c)
end

function glob.eval(c)
    return glob.api.nvim_eval(c)
end

return glob
