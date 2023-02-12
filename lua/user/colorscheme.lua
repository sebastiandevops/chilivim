local colorscheme = "mellifluous"
vim.o.transparent = true
vim.cmd "let &fcs='eob: '"
local status_ok, _ = pcall(vim.cmd, "colorscheme " .. colorscheme)
if not status_ok then
  return
end
