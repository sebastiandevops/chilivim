local status_ok, cokeline = pcall(require, "cokeline")
if not status_ok then
  return
end

local get_hex = require('cokeline.hlgroups').get_hl_attr
local yellow = vim.g.terminal_color_3
local green = vim.g.terminal_color_2

cokeline.setup({
  -- The default highlight group values.
  -- The `fg` and `bg` keys are either colors in hexadecimal format or
  -- functions taking a `buffer` parameter and returning a color in
  -- hexadecimal format. Similarly, the `style` key is either a string
  -- containing a comma separated list of items in `:h attr-list` or a
  -- function returning one.
  default_hl = {
    -- default: `ColorColumn`'s background color for focused buffers,
    -- `Normal`'s foreground color for unfocused ones.
    -- fg = 'hlgroup',
    fg = function(buffer)
      return
        buffer.is_focused
        and get_hex('lualine_a_normal', 'fg')
         or get_hex('lualine_c_replace', 'fg')
    end,
    -- default: `Normal`'s foreground color for focused buffers,
    -- `ColorColumn`'s background color for unfocused ones.
    -- default: `Normal`'s foreground color.
    bg = function(buffer)
      return
        buffer.is_focused
        and get_hex('lualine_b_normal', 'bg')
         or "NONE"
    end,
  },

  -- Left sidebar to integrate nicely with file explorer plugins.
  -- This is a table containing a `filetype` key and a list of `components` to
  -- be rendered in the sidebar.
  -- The last component will be automatically space padded if necessary
  -- to ensure the sidebar and the window below it have the same width.
  sidebar = {
    filetype = 'NvimTree',
    components = {
      {
        text = ' ',
        fg = yellow,
        bg = "NONE",
        bold = true,
      },
    }
  },
  components = {
    {
      text = '▍',
    },
    {
      text = ' ',
    },
    {
      text = function(buffer)
        return buffer.devicon.icon
      end,
      fg = function(buffer)
        return buffer.devicon.color
      end,
    },
    {
      text = ' ',
    },
    {
      text = function(buffer) return buffer.filename .. '  ' end,
      bold = function(buffer) return buffer.is_focused end,
    },
    {
      text = function(buffer) return (buffer.is_modified == true) and ' ' or '' end,
      fg = '#ffefae',
    },
    {
      text = ' ',
    },
    {
      text = '',
      on_click = function(buffer)
        buffer:delete()
      end,
    },
    {
      text = '  ',
    },
  },
})
