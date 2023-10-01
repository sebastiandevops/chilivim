local status_ok, barbecue = pcall(require, "barbecue")
if not status_ok then
  return
end

local theme_status_ok, colors = pcall(require, "core.barbecue.colors")
if not theme_status_ok then
  return
end

-- triggers CursorHold event faster
vim.opt.updatetime = 200

barbecue.setup({
  ---Whether to attach navic to language servers automatically.
  ---
  ---@type boolean
  attach_navic = false,
  ---Filetypes not to enable winbar in.
  ---
  ---@type string[]
  exclude_filetypes = { "nvim-tree", "FTerm" },
  ---Theme to be used for generating highlight groups dynamically.
  ---
  ---@type barbecue.Config.theme
  theme = colors.theme,
})

vim.api.nvim_create_autocmd({
  "WinScrolled", -- or WinResized on NVIM-v0.9 and higher
  "BufWinEnter",
  "CursorHold",
  "InsertLeave",

  -- include this if you have set `show_modified` to `true`
  "BufModifiedSet",
}, {
  group = vim.api.nvim_create_augroup("barbecue.updater", {}),
  callback = function()
    require("barbecue.ui").update()
  end,
})
