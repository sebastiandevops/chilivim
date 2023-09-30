local status_ok, alpha = pcall(require, "alpha")
if not status_ok then
	return
end

local dashboard = require("alpha.themes.dashboard")

dashboard.section.header.val = {
  '          ,/                                                       ',
  '           (                                                       ',
  '          ( * /                                                    ',
  '         (  (((/(*                                                 ',
  '   .*((((((   ((((                                                 ',
  '   #### / ,,    (                                                  ',
  '   #### ,##                                                        ',
  '   ###, #%#      dP""b8 88  88 88 88     88 Yb    dP 88 8b    d8   ',
  '   ###( ###     dP   `" 88  88 88 88     88  Yb  dP  88 88b  d88   ',
  '    ### ,##     Yb      888888 88 88  .o 88   YbdP   88 88YbdP88   ',
  '     %## (#%.    YboodP 88  88 88 88ood8 88    YP    88 88 YY 88   ',
  '      *##% %##                   .#                                ',
  '        ,####(##.            .##%                                  ',
  '            %#####%(########%%                                     ',
  '                    ,,                                             ',
}

dashboard.section.buttons.val = {
    dashboard.button("f",   "  Find File",           "<CMD>Telescope find_files<CR>" ),
    dashboard.button("n",   "  New File",            "<CMD>ene!<CR>" ),
    dashboard.button("p",   "  Recent Projects ",    "<CMD>Telescope projects<CR>" ),
    dashboard.button("r",   "  Recently Used Files", "<CMD>Telescope oldfiles<CR>" ),
    dashboard.button("t",   "  NvimTree",            "<CMD>NvimTreeToggle<CR>" ),
    dashboard.button("N",   "  Neorg Index",         "<CMD>Neorg index<CR>" ),
    dashboard.button("w",   "  Find Word",           "<CMD>Telescope live_grep<CR>" ),
    dashboard.button("c",   "  Edit Configuration",  "<CMD>e ~/.config/nvim/lua/config/options.lua<CR>" ),
    dashboard.button("g",   "  Git status",          "<CMD>Telescope git_status<CR>" ),
    dashboard.button("u",   "⇡  Update",              "<CMD>Lazy update<CR>" ),
    dashboard.button("q",   "  Quit",                "<CMD>quit<CR>"),

}

dashboard.section.footer.opts.hl = "Type"
dashboard.section.header.opts.hl = "Include"
dashboard.section.buttons.opts.hl = "Keyword"

dashboard.opts.opts.noautocmd = true
alpha.setup(dashboard.opts)
