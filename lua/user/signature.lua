local status_ok, signature = pcall(require, "lsp_signature")
if not status_ok then
  return
end

signature.setup {
  floating_window = true,
  floating_window_above_cur_line = true, -- try to place the floating above the current line when possible Note:
  -- will set to true when fully tested, set to false will use whichever side has more space
  -- this setting will be helpful if you do not want the PUM and floating win overlap

  floating_window_off_x = 1, -- adjust float windows x position. 
                             -- can be either a number or function
  floating_window_off_y = 2, -- adjust float windows y position. e.g -2 move window up 2 lines; 2 move down 2 lines
                              -- can be either number or function, see examples
  hint_enable = true,
  handler_opts = {
    border = "rounded"   -- double, rounded, single, shadow, none, or a table of borders
  },
  transparency = 5,
}
