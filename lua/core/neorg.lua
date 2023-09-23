local status_ok, neorg = pcall(require, "neorg")
if not status_ok then
  return
end
local callbacks_status_ok, neorg_callbacks = pcall(require, "neorg.core.callbacks")
if not callbacks_status_ok then
  return
end

neorg.setup {
  load = {
    ["core.defaults"] = {}, -- Loads default behaviour
    ["core.concealer"] = {}, -- Adds pretty icons to your documents
    ["core.summary"] = {},
    ["core.dirman"] = { -- Manages Neorg workspaces
      config = {
        workspaces = {
          notes = "~/notes",
        },
        default_workspace = "notes",
      },
    },
    ["core.completion"] = {
      config = {
        engine = "nvim-cmp",
        name = "[Neorg]"
      },
    },
    ["core.integrations.telescope"] = {},
  },
}

neorg_callbacks.on_event("core.keybinds.events.enable_keybinds", function(_, keybinds)
    -- Map all the below keybinds only when the "norg" mode is active
  keybinds.map_event_to_mode("norg", {
    n = { -- Bind keys in normal mode
      { "<C-s>", "core.integrations.telescope.find_linkable" },
    },

    i = { -- Bind in insert mode
      { "<C-l>", "core.integrations.telescope.insert_link" },
      { "<C-f>", "core.integrations.telescope.insert_file_link" },
    },
  },
  {
    silent = true,
    noremap = true,
  })
end)
