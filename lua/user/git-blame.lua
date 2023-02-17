local status_ok, gitblame = pcall(require, "gitblame")
if not status_ok then
  return
end

local status_ok, configs = pcall(require, "gitblame.configs")
if not status_ok then
	return
end

vim.g.gitblame_enabled = 0
vim.cmd "highlight default link gitblame SpecialComment"
