local status_ok, cokeline = pcall(require, "cokeline")
if not status_ok then
  return
end

local get_hex = require('cokeline.utils').get_hex
local yellow = vim.g.terminal_color_3

cokeline.setup({
  -- Only show the bufferline when there are at least this many visible buffers.
  -- default: `1`.
  show_if_buffers_are_at_least = 1,

  buffers = {
    -- A function to filter out unwanted buffers. Takes a buffer table as a
    -- parameter (see the following section for more infos) and has to return
    -- either `true` or `false`.
    -- default: `false`.
    filter_valid = false,

    -- A looser version of `filter_valid`, use this function if you still
    -- want the `cokeline-{switch,focus}-{prev,next}` mappings to work for
    -- these buffers without displaying them in your bufferline.
    -- default: `false`.
    filter_visible = false,

    -- Which buffer to focus when a buffer is deleted, `prev` focuses the
    -- buffer to the left of the deleted one while `next` focuses the one the
    -- right.
    -- default: 'next'.
    focus_on_delete = 'next',

    -- If set to `last` new buffers are added to the end of the bufferline,
    -- if `next` they are added next to the current buffer.
    -- if set to `directory` buffers are sorted by their full path.
    -- if set to `number` buffers are sorted by bufnr, as in default Neovim
    -- default: 'last'.
    new_buffers_position = 'last',

    -- If true, right clicking a buffer will close it
    -- The close button will still work normally
    -- Default: true
    delete_on_right_click = true,
  },

  mappings = {
    -- Controls what happens when the first (last) buffer is focused and you
    -- try to focus/switch the previous (next) buffer. If `true` the last
    -- (first) buffers gets focused/switched, if `false` nothing happens.
    -- default: `true`.
    cycle_prev_next = true,

    -- Disables mouse mappings
    -- default: `false`.
    disable_mouse = false,
  },

  -- Maintains a history of focused buffers using a ringbuffer
  history = {
    enabled = true,
    size = 2
  },

  rendering = {
    -- The maximum number of characters a rendered buffer is allowed to take
    -- up. The buffer will be truncated if its width is bigger than this
    -- value.
    -- default: `999`.
    max_buffer_width = 999,
  },

  pick = {
    -- Whether to use the filename's first letter first before
    -- picking a letter from the valid letters list in order.
    -- default: `true`
    use_filename = true,

    -- The list of letters that are valid as pick letters. Sorted by
    -- keyboard reachability by default, but may require tweaking for
    -- non-QWERTY keyboard layouts.
    -- default: `'asdfjkl;ghnmxcvbziowerutyqpASDFJKLGHNMXCVBZIOWERTYQP'`
    letters = 'asdfjkl;ghnmxcvbziowerutyqpASDFJKLGHNMXCVBZIOWERTYQP',
  },

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

    -- default: `'NONE'`.
    style = 'NONE',
  },

  -- The highlight group used to fill the tabline space
  fill_hl = 'TabLineFill',

  -- A list of components to be rendered for each buffer. Check out the section
  -- below explaining what this value can be set to.
  -- default: see `/lua/cokeline/defaults.lua`
  -- components = {..},

  -- Custom areas can be displayed on the right hand side of the bufferline.
  -- They act identically to buffer components, except their methods don't take a Buffer object.
  -- If you want a rhs component to be stateful, you can wrap it in a closure containing state.
  -- rhs = {..},

  -- Tabpages can be displayed on either the left or right of the bufferline.
  -- They act the same as other components, except they are passed TabPage objects instead of
  -- buffer objects.
  tabs = {
    placement = "left",
    -- components = {..}
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
        text = '',
        fg = yellow,
        bg = get_hex('NvimTreeNormal', 'bg'),
        style = 'bold',
      },
    }
  },
  components = {
    {
      text = function(buffer) return (buffer.index ~= 1) and '▏' or '' end,
    },
    {
      text = '  ',
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
      style = function(buffer)
        return buffer.is_focused and 'bold' or nil
      end,
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
