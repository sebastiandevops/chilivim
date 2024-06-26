local on_attach_ok, my_keymaps = pcall(require, "core.nvimtree.on_attach")
if not on_attach_ok then
  return
end

local M = {}

function M.presettings()
  vim.g.loaded_netrw = 1
  vim.g.loaded_netrwPlugin = 1
end

M.config = {
  auto_reload_on_write = true,
  hijack_netrw = true,
  on_attach = my_keymaps.on_attach,
  sync_root_with_cwd = true, --Changes the tree root directory on `DirChanged` and refreshes the tree
  update_focused_file = {
    enable = true,
    update_root = true, -- enable this feature may cause an error related with function 'cmd'
  },
  renderer = {
    root_folder_label = ":t",
    group_empty = true,
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
      web_devicons = {
        file = {
          enable = true,
          color = true,
        },
        folder = {
          enable = false,
          color = true,
        },
      },
      glyphs = {
        git = {
          unstaged = "",
          staged = "S",
          unmerged = "",
          renamed = "➜",
          untracked = "U",
          deleted = "",
          ignored = "◌",
        },
      },
    },
  },
  diagnostics = {
    enable = true,
    show_on_dirs = false,
    show_on_open_dirs = true,
  },
  filters = {
    dotfiles = false,
  },
  modified = {
    enable = true,
    show_on_dirs = false,
    show_on_open_dirs = true,
  },
  filesystem_watchers = {
    enable = true,
    debounce_delay = 80,
    ignore_dirs = {},
  },
  view = {
    centralize_selection = false,
    cursorline = true,
    debounce_delay = 51,
    width = 30,
    side = "left",
  },
}

return M
