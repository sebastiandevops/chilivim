local copilot_status_ok, copilot = pcall(require, 'copilot')
if not copilot_status_ok then
  return
end

copilot.setup({
  suggestion = {
    enabled = false,
    auto_trigger = true,
    debounce = 300,
  },
  panel = { enabled = false },
  filetypes = {
    yaml = true,
    markdown = true,
    help = true,
    gitcommit = true,
    gitrebase = true,
    hgcommit = true,
    svn = true,
    cvs = true,
    ["."] = true,
  },
})
