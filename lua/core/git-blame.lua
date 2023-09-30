local status_ok, gitblame = pcall(require, "gitblame")
if not status_ok then
  return
end

gitblame.setup {
   --Note how the `gitblame_` prefix is omitted in `setup`
  enabled = true,
}
vim.cmd "highlight default link gitblame SpecialComment"
