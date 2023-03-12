local status_ok, matchup = pcall(require, "vim-matchup")
if not status_ok then
  return
end

local status_ok, configs = pcall(require, "vim-matchup.configs")
if not status_ok then
	return
end

configs.setup({
  vim.g.matchup_matchparen_offscreen { method = "popup" },
})
