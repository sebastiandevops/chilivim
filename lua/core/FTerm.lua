local status_ok, FTerm = pcall(require, "FTerm")
if not status_ok then
  return
end

FTerm.setup({
  border = 'double',
  dimensions  = {
      height = 0.9,
      width = 0.9,
  },
})

-- Example keybindings
vim.keymap.set('n', '<C-\\>', '<CMD>lua require("FTerm").toggle()<CR>')
vim.keymap.set('t', '<C-\\>', '<C-\\><C-n><CMD>lua require("FTerm").toggle()<CR>')
