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
  show_warnings = true,
  highlights = {
    defaults = { bold = true },
  }
})
