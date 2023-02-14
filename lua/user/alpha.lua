local status_ok, alpha = pcall(require, "alpha")
if not status_ok then
	return
end

local dashboard = require("alpha.themes.dashboard")
dashboard.section.header.val = {
  '                           ',
  '                           ',
  '                           ',
  '                           ',
  '88b 88 Yb    dP 88 8b    d8',
  '88Yb88  Yb  dP  88 88b  d88',
  '88 Y88   YbdP   88 88YbdP88',
  '88  Y8    YP    88 88 YY 88',
  '                           ',
}
dashboard.section.buttons.val = {
    dashboard.button("f",   "  Find File",                   "<CMD>Telescope find_files<CR>" ),
    dashboard.button("n",   "  New File",                    "<CMD>ene!<CR>" ),
    dashboard.button("p",   "  Recent Projects ",            "<CMD>Telescope projects<CR>" ),
    dashboard.button("u",   "  Recently Used Files",         "<CMD>Telescope oldfiles<CR>" ),
    -- dashboard.button( { "SPC s",   "  Load last session",           "<CMD>SessionLoad<CR>" ),
    dashboard.button("t",   "  NvimTree",                      "<CMD>NvimTreeToggle<CR>" ),
    dashboard.button("m",   "  Marks              ",         "<CMD>Telescope marks<CR>" ),
    dashboard.button("w",   "  Find Word",                   "<CMD>Telescope live_grep<CR>" ),
    dashboard.button("c",   "  Edit Configuration",          "<CMD>e ~/.config/nvim/lua/plugins/init.lua<CR>" ),
    dashboard.button("g",   "  Git status",                  "<CMD>Telescope git_status<CR>" ),
}

local function footer()
-- NOTE: requires the fortune-mod package to work
	-- local handle = io.popen("fortune")
	-- local fortune = handle:read("*a")
	-- handle:close()
	-- return fortune
	return "chrisatmachine.com"
end

dashboard.section.footer.val = footer()

dashboard.section.footer.opts.hl = "Type"
dashboard.section.header.opts.hl = "Include"
dashboard.section.buttons.opts.hl = "Keyword"

dashboard.opts.opts.noautocmd = true
-- vim.cmd([[autocmd User AlphaReady echo 'ready']])
alpha.setup(dashboard.opts)
