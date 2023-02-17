local status_ok, mellifluous = pcall(require, "mellifluous")
if not status_ok then
  return
end

mellifluous.setup {
  transparent_background = {
    enabled = true,
    floating_windows = true,
    telescope = true,
    file_tree = true,
    cursor_line = true,
    status_line = true,
  },
}
