-- local M = {}

local nvim_tree_status_ok, nvim_tree = pcall(require, "nvim-tree")
if not nvim_tree_status_ok then
  return
end

local config_status_ok, nvim_tree_config = pcall(require, "nvim-tree.config")
if not config_status_ok then
  return
end

local tree_cb = nvim_tree_config.nvim_tree_callback

-- disable netrw at the very start of your init.lua (strongly advised)
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

local function on_attach(bufnr)
  local api = require('nvim-tree.api')

  local function opts(desc)
    return { desc = 'nvim-tree: ' .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
  end

  -- Default mappings. Feel free to modify or remove as you wish.
  api.config.mappings.default_on_attach(bufnr)
  -- END_DEFAULT_ON_ATTACH

  -- Mappings migrated from view.mappings.list
  -- You will need to insert "your code goes here" for any mappings with a custom action_cb
  vim.keymap.set('n', 'l', api.node.open.edit, opts('Open'))
  vim.keymap.set('n', '<CR>', api.node.open.edit, opts('Open'))
  vim.keymap.set('n', 'o', api.node.open.edit, opts('Open'))
  vim.keymap.set('n', 'h', api.node.navigate.parent_close, opts('Close Directory'))
  vim.keymap.set('n', 'v', api.node.open.vertical, opts('Open: Vertical Split'))

end

M.setup = {
  -- auto_reload_on_write = true,
  -- disable_netrw = false,
  -- hijack_cursor = false,
  -- hijack_netrw = true,
  -- hijack_unnamed_buffer_when_opening = false,
  -- sort_by = "name",
  -- root_dirs = {},
  -- prefer_startup_root = false,
  -- sync_root_with_cwd = false,
  -- reload_on_bufenter = false,
  -- respect_buf_cwd = false,
  -- on_attach = on_attach,
  -- remove_keymaps = false,
  -- select_prompts = false,
  -- update_focused_file = {
  --   enable = true,
  --   update_root = true, -- enable this feature may cause an error related with function 'cmd'
  -- },
  -- renderer = {
  --   root_folder_modifier = ":t",
  --   group_empty = true,
  --   root_folder_label = ":~:s?$?/..?",
  --   indent_markers = {
  --     enable = false,
  --     inline_arrows = true,
  --     icons = {
  --       corner = "└",
  --       edge = "│",
  --       item = "│",
  --       bottom = "─",
  --       none = " ",
  --     },
  -- },
  --   icons = {
  --     glyphs = {
  --       default = "",
  --       symlink = "",
  --       folder = {
  --         arrow_open = "",
  --         arrow_closed = "",
  --         default = "",
  --         open = "",
  --         empty = "",
  --         empty_open = "",
  --         symlink = "",
  --         symlink_open = "",
  --       },
  --       git = {
  --         unstaged = "",
  --         staged = "S",
  --         unmerged = "",
  --         renamed = "➜",
  --         untracked = "U",
  --         deleted = "",
  --         ignored = "◌",
  --       },
  --     },
  --   },
  -- },
  -- diagnostics = {
  --   enable = true,
  --   show_on_dirs = false,
  --   show_on_open_dirs = true,
  --   icons = {
  --     hint = "",
  --     info = "",
  --     warning = "",
  --     error = "",
  --   },
  -- },
  -- filesystem_watchers = {
  --   enable = true,
  --   debounce_delay = 80,
  --   ignore_dirs = {},
  -- },
  -- view = {
  --   centralize_selection = false,
  --   cursorline = true,
  --   debounce_delay = 51,
  --   width = 67,
  --   side = "left",
  --   mappings = {
  --     list = {
  --       { key = { "l", "<CR>", "o" }, cb = tree_cb "edit" },
  --       { key = "h", cb = tree_cb "close_node" },
  --       { key = "v", cb = tree_cb "vsplit" },
  --     },
  --   },
  -- },
  -- git = {
  --   enable = true,
  --   ignore = false,
  --   show_on_dirs = true,
  --   show_on_open_dirs = true,
  --   timeout = 452,
  -- },
  auto_reload_on_write = true,
  disable_netrw = false,
  hijack_cursor = false,
  hijack_netrw = true,
  hijack_unnamed_buffer_when_opening = false,
  sort = {
    sorter = "name",
    folders_first = true,
  },
  root_dirs = {},
  prefer_startup_root = false,
  sync_root_with_cwd = false,
  reload_on_bufenter = false,
  respect_buf_cwd = false,
  on_attach = on_attach,
  select_prompts = false,
  view = {
    centralize_selection = false,
    cursorline = true,
    debounce_delay = 88,
    width = 104,
    hide_root_folder = false,
    side = "left",
    preserve_window_proportions = false,
    number = false,
    relativenumber = false,
    signcolumn = "yes",
    float = {
      enable = false,
      quit_on_focus_loss = true,
      open_win_config = {
        relative = "editor",
        border = "rounded",
        width = 117,
        height = 118,
        row = 90,
        col = 91,
      },
    },
  },
  renderer = {
    add_trailing = false,
    group_empty = false,
    highlight_git = false,
    full_name = false,
    highlight_opened_files = "none",
    highlight_modified = "none",
    root_folder_label = ":~:s?$?/..?",
    indent_width = 104,
    indent_markers = {
      enable = false,
      inline_arrows = true,
      icons = {
        corner = "└",
        edge = "│",
        item = "│",
        bottom = "─",
        none = " ",
      },
    },
    icons = {
      webdev_colors = true,
      git_placement = "before",
      modified_placement = "after",
      padding = " ",
      symlink_arrow = " ➛ ",
      show = {
        file = true,
        folder = true,
        folder_arrow = true,
        git = true,
        modified = true,
      },
      glyphs = {
        default = "",
        symlink = "",
        bookmark = "󰆤",
        modified = "●",
        folder = {
          arrow_closed = "",
          arrow_open = "",
          default = "",
          open = "",
          empty = "",
          empty_open = "",
          symlink = "",
          symlink_open = "",
        },
        git = {
          unstaged = "✗",
          staged = "✓",
          unmerged = "",
          renamed = "➜",
          untracked = "★",
          deleted = "",
          ignored = "◌",
        },
      },
    },
    special_files = { "Cargo.toml", "Makefile", "README.md", "readme.md" },
    symlink_destination = true,
  },
  hijack_directories = {
    enable = true,
    auto_open = true,
  },
  update_focused_file = {
    enable = false,
    update_root = false,
    ignore_list = {},
  },
  system_open = {
    cmd = "",
    args = {},
  },
  diagnostics = {
    enable = false,
    show_on_dirs = false,
    show_on_open_dirs = true,
    debounce_delay = 223,
    severity = {
      min = vim.diagnostic.severity.HINT,
      max = vim.diagnostic.severity.ERROR,
    },
    icons = {
      hint = "",
      info = "",
      warning = "",
      error = "",
    },
  },
  filters = {
    git_ignored = true,
    dotfiles = false,
    git_clean = false,
    no_buffer = false,
    custom = {},
    exclude = {},
  },
  filesystem_watchers = {
    enable = true,
    debounce_delay = 245,
    ignore_dirs = {},
  },
  git = {
    enable = true,
    show_on_dirs = true,
    show_on_open_dirs = true,
    disable_for_dirs = {},
    timeout = 603,
  },
  modified = {
    enable = false,
    show_on_dirs = true,
    show_on_open_dirs = true,
  },
  actions = {
    use_system_clipboard = true,
    change_dir = {
      enable = true,
      global = false,
      restrict_above_cwd = false,
    },
    expand_all = {
      max_folder_discovery = 518,
      exclude = {},
    },
    file_popup = {
      open_win_config = {
        col = 224,
        row = 225,
        relative = "cursor",
        border = "shadow",
        style = "minimal",
      },
    },
    open_file = {
      quit_on_open = false,
      eject = true,
      resize_window = true,
      window_picker = {
        enable = true,
        picker = "default",
        chars = "ABCDEFGHIJKLMNOPQRSTUVWXYZ1234568127",
        exclude = {
          filetype = { "notify", "packer", "qf", "diff", "fugitive", "fugitiveblame" },
          buftype = { "nofile", "terminal", "help" },
        },
      },
    },
    remove_file = {
      close_window = true,
    },
  },
  trash = {
    cmd = "gio trash",
  },
  live_filter = {
    prefix = "[FILTER]: ",
    always_show_folders = true,
  },
  tab = {
    sync = {
      open = false,
      close = false,
      ignore = {},
    },
  },
  notify = {
    threshold = vim.log.levels.INFO,
    absolute_path = true,
  },
  ui = {
    confirm = {
      remove = true,
      trash = true,
    },
  },
  experimental = {},
  log = {
    enable = false,
    truncate = false,
    types = {
      all = false,
      config = false,
      copy_paste = false,
      dev = false,
      diagnostics = false,
      git = false,
      profile = false,
      watcher = false,
    },
  },
}

-- M = nvim_tree.setup { setup }

return M
