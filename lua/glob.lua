local glob = {}

glob.g = vim.g
glob.b = vim.b
glob.o = vim.o
glob.opt = vim.opt
glob.fn = vim.fn
glob.api = vim.api

function glob.map(maps)
    for _,map in pairs(maps) do
        glob.api.nvim_set_keymap(map[1], map[2], map[3], map[4])
    end
end

function glob.cmd(cmd)
    glob.api.nvim_command(cmd)
end

function glob.exec(c)
    glob.api.nvim_exec(c)
end

function glob.eval(c)
    return glob.api.nvim_eval(c)
end

return glob
