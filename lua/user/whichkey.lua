local status_ok, which_key = pcall(require, "which-key")
if not status_ok then
  return
end

local setup = {
  plugins = {
    marks = true, -- shows a list of your marks on ' and `
    registers = true, -- shows your registers on " in NORMAL or <C-r> in INSERT mode
    spelling = {
      enabled = true, -- enabling this will show WhichKey when pressing z= to select spelling suggestions
      suggestions = 20, -- how many suggestions should be shown in the list?
    },
    -- the presets plugin, adds help for a bunch of default keybindings in Neovim
    -- No actual key bindings are created
    presets = {
      operators = true, -- adds help for operators like d, y, ... and registers them for motion / text object completion
      motions = true, -- adds help for motions
      text_objects = true, -- help for text objects triggered after entering an operator
      windows = true, -- default bindings on <c-w>
      nav = true, -- misc bindings to work with windows
      z = true, -- bindings for folds, spelling and others prefixed with z
      g = true, -- bindings for prefixed with g
    },
  },
  -- add operators that will trigger motion and text object completion
  -- to enable all native operators, set the preset / operators plugin above
  -- operators = { gc = "Comments" },
  key_labels = {
    -- override the label used to display some keys. It doesn't effect WK in any other way.
    -- For example:
    -- ["<space>"] = "SPC",
    -- ["<cr>"] = "RET",
    -- ["<tab>"] = "TAB",
  },
  icons = {
    breadcrumb = "»", -- symbol used in the command line area that shows your active key combo
    separator = "➜", -- symbol used between a key and it's label
    group = "+", -- symbol prepended to a group
  },
  popup_mappings = {
    scroll_down = "<c-d>", -- binding to scroll down inside the popup
    scroll_up = "<c-u>", -- binding to scroll up inside the popup
  },
  window = {
    border = "rounded", -- none, single, double, shadow
    position = "bottom", -- bottom, top
    margin = { 1, 0, 1, 0 }, -- extra window margin [top, right, bottom, left]
    padding = { 2, 2, 2, 2 }, -- extra window padding [top, right, bottom, left]
    winblend = 0,
  },
  layout = {
    height = { min = 4, max = 25 }, -- min and max height of the columns
    width = { min = 20, max = 50 }, -- min and max width of the columns
    spacing = 3, -- spacing between columns
    align = "left", -- align columns left, center or right
  },
  ignore_missing = false, -- enable this to hide mappings for which you didn't specify a label
  hidden = { "<silent>", "<cmd>", "<Cmd>", "<CR>", "call", "lua", "^:", "^ " }, -- hide mapping boilerplate
  show_help = true, -- show help message on the command line when the popup is visible
  show_keys = true, -- show the currently pressed key.
  triggers = "auto", -- automatically setup triggers
  -- triggers = {"<leader>"} -- or specify a list manually
  triggers_blacklist = {
    -- list of mode / prefixes that should never be hooked by WhichKey
    -- this is mostly relevant for key maps that start with a native binding
    -- most people should not need to change this
    i = { "j", "k" },
    v = { "j", "k" },
  },
}

local opts = {
  mode = "n", -- NORMAL mode
  prefix = "<leader>",
  buffer = nil, -- Global mappings. Specify a buffer number for buffer local mappings
  silent = true, -- use `silent` when creating keymaps
  noremap = true, -- use `noremap` when creating keymaps
  nowait = true, -- use `nowait` when creating keymaps
}

local vopts = {
  mode = "v", -- VISUAL mode
  prefix = "<leader>",
  buffer = nil, -- Global mappings. Specify a buffer number for buffer local mappings
  silent = true, -- use `silent` when creating keymaps
  noremap = true, -- use `noremap` when creating keymaps
  nowait = true, -- use `nowait` when creating keymaps
}

local vmappings = {
  ["/"] = { "<Plug>(comment_toggle_linewise_visual)", "Comment toggle linewise (visual)" },
}
local mappings = {
  ["/"] = { "<Plug>(comment_toggle_linewise_current)", "Comment toggle current line" },
  ["a"] = { "<cmd>Alpha<cr>", "Alpha" },
  ["b"] = {
    "<cmd>lua require('telescope.builtin').buffers(require('telescope.themes').get_dropdown{previewer = false})<cr>",
    "Buffers",
  },
  ["e"] = { "<cmd>NvimTreeToggle<cr>", "Explorer" },
  ["w"] = { "<cmd>w!<CR>", "Save" },
  ["q"] = { "<cmd>q!<CR>", "Quit" },
  ["c"] = { "<cmd>Bdelete!<CR>", "Close Buffer" },
  ["h"] = { "<cmd>nohlsearch<CR>", "No Highlight" },
  ["f"] = {
    "<cmd>lua require('telescope.builtin').find_files(require('telescope.themes').get_dropdown{previewer = false})<cr>",
    "Find files",
  },
  ["F"] = { "<cmd>Telescope live_grep theme=ivy<cr>", "Find Text" },
  ["P"] = { "<cmd>lua require('telescope').extensions.projects.projects()<cr>", "Projects" },
  ["?"] = { "<cmd>Cheat<CR>", "Cheatsheets" },

  L = {
    name = "Lazy",
    C = { "<cmd>Lazy build<cr>", "Build" },
    i = { "<cmd>Lazy install<cr>", "Install" },
    s = { "<cmd>Lazy sync<cr>", "Sync" },
    c = { "<cmd>Lazy check<cr>", "Check" },
    u = { "<cmd>Lazy update<cr>", "Update" },
  },

  g = {
    name = "Git",
    g = { "<cmd>lua _LAZYGIT_TOGGLE()<CR>", "Lazygit" },
    j = { "<cmd>lua require 'gitsigns'.next_hunk()<cr>", "Next Hunk" },
    k = { "<cmd>lua require 'gitsigns'.prev_hunk()<cr>", "Prev Hunk" },
    l = { "<cmd>lua require 'gitsigns'.blame_line()<cr>", "Blame" },
    p = { "<cmd>lua require 'gitsigns'.preview_hunk()<cr>", "Preview Hunk" },
    r = { "<cmd>lua require 'gitsigns'.reset_hunk()<cr>", "Reset Hunk" },
    R = { "<cmd>lua require 'gitsigns'.reset_buffer()<cr>", "Reset Buffer" },
    s = { "<cmd>lua require 'gitsigns'.stage_hunk()<cr>", "Stage Hunk" },
    u = {
      "<cmd>lua require 'gitsigns'.undo_stage_hunk()<cr>",
      "Undo Stage Hunk",
    },
    o = { "<cmd>Telescope git_status<cr>", "Open changed file" },
    b = { "<cmd>Telescope git_branches<cr>", "Checkout branch" },
    c = { "<cmd>Telescope git_commits<cr>", "Checkout commit" },
    d = {
      "<cmd>Gitsigns diffthis HEAD<cr>",
      "Diff",
    },
  },

  l = {
    name = "LSP",
    a = { "<cmd>lua vim.lsp.buf.code_action()<cr>", "Code Action" },
    d = {
      "<cmd>Telescope diagnostics bufnr=0<cr>",
      "Document Diagnostics",
    },
    w = {
      "<cmd>Telescope diagnostics<cr>",
      "Workspace Diagnostics",
    },
    f = { "<cmd>lua vim.lsp.buf.format{async=true}<cr>", "Format" },
    i = { "<cmd>LspInfo<cr>", "Info" },
    I = { "<cmd>LspInstallInfo<cr>", "Installer Info" },
    j = {
      "<cmd>lua vim.lsp.diagnostic.goto_next()<CR>",
      "Next Diagnostic",
    },
    k = {
      "<cmd>lua vim.lsp.diagnostic.goto_prev()<cr>",
      "Prev Diagnostic",
    },
    l = { "<cmd>lua vim.lsp.codelens.run()<cr>", "CodeLens Action" },
    q = { "<cmd>lua vim.diagnostic.setloclist()<cr>", "Quickfix" },
    r = { "<cmd>lua vim.lsp.buf.rename()<cr>", "Rename" },
    s = { "<cmd>Telescope lsp_document_symbols<cr>", "Document Symbols" },
    S = {
      "<cmd>Telescope lsp_dynamic_workspace_symbols<cr>",
      "Workspace Symbols",
    },
  },
  s = {
    name = "Search",
    b = { "<cmd>Telescope git_branches<cr>", "Checkout branch" },
    c = { "<cmd>Telescope colorscheme<cr>", "Colorscheme" },
    h = { "<cmd>Telescope help_tags<cr>", "Find Help" },
    M = { "<cmd>Telescope man_pages<cr>", "Man Pages" },
    r = { "<cmd>Telescope oldfiles<cr>", "Open Recent File" },
    R = { "<cmd>Telescope registers<cr>", "Registers" },
    k = { "<cmd>Telescope keymaps<cr>", "Keymaps" },
    C = { "<cmd>Telescope commands<cr>", "Commands" },
  },
  x = {
    name = "Terminal",
    p = { "<cmd>lua _PYTHON_TOGGLE()<cr>", "Python" },
    f = { "<cmd>ToggleTerm direction=float<cr>", "Float" },
  },
    -- Personal:
  t = {
  name = "+Trouble",
    r = { "<cmd>Trouble lsp_references<cr>",               "References" },
    f = { "<cmd>Trouble lsp_definitions<cr>",              "Definitions" },
    d = { "<cmd>Trouble document_diagnostics<cr>",         "Diagnostics" },
    q = { "<cmd>Trouble quickfix<cr>",                     "QuickFix" },
    l = { "<cmd>Trouble loclist<cr>",                      "LocationList" },
    w = { "<cmd>Trouble workspace_diagnostics<cr>",        "Workspace Diagnostics" },
  },

  u = {
    name = "+Utils",
    d = { ":call DeleteEndingWhiteSpace()<cr>",            "Remove trailing whitespaces" },
    r = { "<cmd>SearchBoxReplace confirm=menu<CR>",        "Search&Replace" },
    f = { ":%!jq .<CR>",                                   "Format Json" },
  },
  o = {
    name = "Toggle Display Options",
    a = { ":call ToggleAll()<CR>",                         "Toggle All"},
    c = { ":call ToggleColourCursorColumn()<CR>",          "Toggle cursor Column visibility"},
    e = { ":call ToggleColourWhiteSpaceAtEndOfLine()<CR>", "Toggle whitespace at End of line visibility"},
    d = { "<cmd>DocsViewToggle<cr>",                       "Toggle docs-view"},
    h = { ":ColorizerToggle<CR>",                          "Toggle Hex colour and colour name matches"},
    i = { ":call ToggleColourIncSearch()<CR>",             "Toggle hIghlight matching words under cursor"},
    l = { ":call ToggleColourCursorLine()<CR>",            "Toggle cursor Line visibility"},
    m = { ":call ToggleMarkerLines()<CR>",                 "Toggle Marker lines"},
    r = { ":set wrap!<CR>",                                "Toggle line wRap"},
    s = { ":set spell!<CR>",                               "Toggle Spell checking"},
    t = { ":call ToggleColourLineTooLong()<CR>",           "Toggle line Too long highlighting"},
    w = { ":set list!<CR>",                                "Toggle Whitespace visibility"},
    y = { ":call ToggleColourSyntax()<CR>",                "Toggle sYntax highlighting"}
  },
  j = {
    name = "Show/Jump various dev info",
    a = {":silent exec '!jump Artifact %:p:h'<CR>",        "Jump Artifactory (project)"},
    c = {":silent exec '!jump Ci %:p:h'<CR>",              "Jump Ci (project)"},
    h = {":call OpenHelpPage()<CR>",                       "Jump vim Help page for word under cursor"},
    i = {":silent exec '!jump Live %:p:h'<CR>",            "Jump lIve (project)"},
    j = {":call JumpToSelection()<CR>",                    "Jump to url or hex color or git etc"},
    l = {":silent exec '!jump Lint %:p:h'<CR>",            "Jump Lint (project)"},
    m = {":<C-U>exe 'Man' v:count '<C-R><C-W>'<CR>",       "Jump linux Man page for word under cursor"},
    n = {":silent exec '!jump Notes %:p:h'<CR>",           "Jump Notes (project search in confluence)"},
    r = {":silent exec '!jump Repo %:p:h'<CR>",            "Jump Repo (git or bitbucket)"},
    s = {":call ShowJira()<CR>",                           "Show jira ticket in new buffer"},
    t = {":silent exec '!jump Ticket %:p:h'<CR>",          "Jump jira Ticket in browser"},
    u = {":silent exec '!jump TestReports %:p:h'<CR>",     "Jump Unit test reports"}
  },
}

which_key.setup(setup)
which_key.register(mappings, opts)
which_key.register(vmappings, vopts)
