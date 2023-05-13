local status_ok, modicator = pcall(require, "modicator")
if not status_ok then
  return
end

local colors = {
  normal     = "#e0def4",
  insert     = "#e95378",
  select     = "#fcb2aa",
  command    = "#09f7a0",
  substitute = "#a86ec9",
}

modicator.setup({
  show_warnings = false,
  highlights = {
    defaults = { bold = true },
    modes = {
      ['n']  = { foreground = colors.normal },
      ['i']  = { foreground = colors.insert },
      ['v']  = { foreground = colors.select },
      ['V']  = { foreground = colors.select },
      ['^V'] = { foreground = colors.select },
      ['s']  = { foreground = colors.substitute },
      ['S']  = { foreground = colors.substitute },
      ['R']  = { foreground = colors.insert },
      ['c']  = { foreground = colors.command },
    }
  }
})
