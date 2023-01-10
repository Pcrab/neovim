local glob = require("glob")
local system = ""

local has = glob.fn.has

if has("macunix") == 1 then
    system = "Darwin"
elseif has("linux") == 1 then
    if has("wsl") == 1 then
        system = "WSL"
    else
        system = "Linux"
    end
end

return system
