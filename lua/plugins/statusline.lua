-- [nfnl] Compiled from fnl/plugins/statusline.fnl by https://github.com/Olical/nfnl, do not edit.
local function file_info()
  local encoding = vim.opt.fileencoding.get()
  local format = vim.bo.fileformat
  return string.format("%s,%s", encoding, format)
end
local function lsp()
  local clients = vim.lsp.get_clients({bufnr = 0})
  local names
  local function _1_(client)
    return client.name
  end
  names = vim.tbl_map(_1_)
  return table.concat(names, ",")
end
local function position()
  local row, col = unpack(vim.api.nvim_win_get_cursor(0))
  local lines = vim.api.nvim_buf_line_count(vim.api.nvim_win_get_buf(0))
  if (row == 1) then
    return string.format("TOP/%d:%d", lines, col)
  elseif (row == lines) then
    return string.format("BOT/%d:%d", lines, col)
  else
    return string.format("%3d/%d:%-3d", row, lines, col)
  end
end
local block = {"", draw_empty = true, separator = {left = "\226\150\136"}}
local nvim_tree = {filetypes = {"neo-tree"}, sections = {lualine_a = {block}, lualine_c = {"filetype"}, lualine_z = {block}}}
return {{"nvim-lualine/lualine.nvim", dependencies = {"nvim-tree/nvim-web-devicons"}, opts = {options = {component_separators = {left = "\238\130\187", right = "\238\130\187"}, section_separators = {left = "\238\130\188", right = "\238\130\186"}}, sections = {lualine_a = {"mode"}, lualine_b = {{"branch", draw_empty = true}, "diff", "diagnostics"}, lualine_c = {{"filename", path = 1, symbols = {modified = "*", readonly = "\239\128\163"}}}, lualine_x = {"filetype", {1, file_info, "icon", "\243\176\139\189"}}, lualine_y = {{lsp, icon = "\238\136\143"}}, lualine_z = {{position, icon = "\243\176\134\164"}}}, inactive_section = {lualine_a = {block}, lualine_b = {}, lualine_c = {{"filename", path = 1, symbols = {modified = "*", readonly = "\239\128\163"}}}, lualine_x = {{file_info, icon = "\243\176\139\189"}}, lualine_y = {}, lualine_z = {block}}, extensions = {nvim_tree}}}}
