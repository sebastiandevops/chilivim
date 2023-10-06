local notify_status_ok, notify = pcall(require, 'notify')
if not notify_status_ok then
  return
end

notify.setup({
  background_colour = "#1a1b25",
  fps = 30,
  icons = {
    DEBUG = "",
    ERROR = "",
    INFO = "",
    TRACE = "✎",
    WARN = ""
  },
  level = 2,
  minimum_width = 50,
  render = "compact",
  stages = "fade_in_slide_out",
  timeout = 2000,
  top_down = true
})
