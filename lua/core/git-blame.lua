local status_ok, gitblame = pcall(require, "gitblame")
if not status_ok then
  return
end

gitblame.setup {
   --Note how the `gitblame_` prefix is omitted in `setup`
  enabled = true,
}
vim.g["gitblame_highlight_group"] = "GitSignsCurrentLineBlame"
vim.g["gitblame_date_format"] = "%x"
