local M = {}

M.opts = {
  mode = "n", -- NORMAL mode
  prefix = "<leader>",
  buffer = nil, -- Global mappings. Specify a buffer number for buffer local mappings
  silent = true, -- use `silent` when creating keymaps
  noremap = true, -- use `noremap` when creating keymaps
  nowait = true, -- use `nowait` when creating keymaps
}

M.vopts = {
  mode = "v", -- VISUAL mode
  prefix = "<leader>",
  buffer = nil, -- Global mappings. Specify a buffer number for buffer local mappings
  silent = true, -- use `silent` when creating keymaps
  noremap = true, -- use `noremap` when creating keymaps
  nowait = true, -- use `nowait` when creating keymaps
}

M.vmappings = {
  ["/"] = { "<Plug>(comment_toggle_linewise_visual)",                 "Comment toggle linewise (visual)" },
}

M.mappings = {
  ["/"] = { "<Plug>(comment_toggle_linewise_current)",                "Comment toggle current line" },
  [";"] = { "<cmd>Alpha<cr>",                                         "Dashboard" },
  ["b"] = {
    "<cmd>lua require('telescope.builtin').buffers(require('telescope.themes').get_dropdown{previewer = false})<cr>",
    "Buffers",
  },
  ["c"] = { "<cmd>Bdelete!<CR>",                                                "Close Buffer" },
  ["C"] = { "<cmd>CodeActionMenu<CR>",                                          "Code Actions Menu"},
  ["d"] = { "<cmd>Neogen<CR>",                                                  "Generate Docstring"},
  ["e"] = { "<cmd>NvimTreeToggle<cr>",                                          "Explorer" },
  ["f"] = {
    "<cmd>lua require('telescope.builtin').find_files(require('telescope.themes').get_dropdown{previewer = false})<cr>",
    "Find files",
  },
  ["F"] = { "<cmd>Telescope live_grep theme=ivy<cr>",                           "Find Text" },
  ["h"] = { "<cmd>nohlsearch<CR>",                                              "No Highlight" },
  ["P"] = { "<cmd>lua require('telescope').extensions.projects.projects()<cr>", "Projects" },
  ["q"] = { "<cmd>q!<CR>",                                                      "Quit" },
  ["w"] = { "<cmd>w!<CR>",                                                      "Save" },
  ["?"] = { "<cmd>Cheat<CR>",                                                   "Cheatsheets" },
  ["%"] = { "<cmd>source%<CR>",                                                 "Source Neovim Configuration"},

  L = {
    name = "Lazy",
    C = { "<cmd>Lazy build<cr>",                               "Build" },
    i = { "<cmd>Lazy install<cr>",                             "Install" },
    s = { "<cmd>Lazy sync<cr>",                                "Sync" },
    c = { "<cmd>Lazy check<cr>",                               "Check" },
    u = { "<cmd>Lazy update<cr>",                              "Update" },
  },

  g = {
    name = "Git",
    g = { "<cmd>LazyGit<CR>",                                  "Lazygit" },
    j = { "<cmd>lua require 'gitsigns'.next_hunk()<cr>",       "Next Hunk" },
    k = { "<cmd>lua require 'gitsigns'.prev_hunk()<cr>",       "Prev Hunk" },
    l = { "<cmd>lua require 'gitsigns'.blame_line()<cr>",      "Blame" },
    p = { "<cmd>lua require 'gitsigns'.preview_hunk()<cr>",    "Preview Hunk" },
    r = { "<cmd>lua require 'gitsigns'.reset_hunk()<cr>",      "Reset Hunk" },
    R = { "<cmd>lua require 'gitsigns'.reset_buffer()<cr>",    "Reset Buffer" },
    s = { "<cmd>lua require 'gitsigns'.stage_hunk()<cr>",      "Stage Hunk" },
    u = { "<cmd>lua require 'gitsigns'.undo_stage_hunk()<cr>", "Undo Stage Hunk", },
    o = { "<cmd>Telescope git_status<cr>",                     "Open changed file" },
    b = { "<cmd>Telescope git_branches<cr>",                   "Checkout branch" },
    c = { "<cmd>Telescope git_commits<cr>",                    "Checkout commit" },
    d = { "<cmd>Gitsigns diffthis HEAD<cr>",                   "Diff", },
  },

  l = {
    name = "LSP",
    a = { "<cmd>lua vim.lsp.buf.code_action()<cr>",            "Code Action" },
    d = { "<cmd>Telescope diagnostics bufnr=0<cr>",            "Document Diagnostics", },
    w = { "<cmd>Telescope diagnostics<cr>",                    "Workspace Diagnostics", },
    f = { "<cmd>lua vim.lsp.buf.format{async=true}<cr>",       "Format" },
    i = { "<cmd>LspInfo<cr>",                                  "Info" },
    I = { "<cmd>LspInstallInfo<cr>",                           "Installer Info" },
    j = { "<cmd>lua vim.lsp.diagnostic.goto_next()<CR>",       "Next Diagnostic", },
    k = { "<cmd>lua vim.lsp.diagnostic.goto_prev()<cr>",       "Prev Diagnostic", },
    l = { "<cmd>lua vim.lsp.codelens.run()<cr>",               "CodeLens Action" },
    q = { "<cmd>lua vim.diagnostic.setloclist()<cr>",          "Quickfix" },
    r = { "<cmd>lua vim.lsp.buf.rename()<cr>",                 "Rename" },
    s = { "<cmd>Telescope lsp_document_symbols<cr>",           "Document Symbols" },
    S = { "<cmd>Telescope lsp_dynamic_workspace_symbols<cr>",  "Workspace Symbols",
    },
  },

  n = {
    name = "Noice",
    h = { "<cmd>Noice history<cr>",                            "Show the message history" },
    l = { "<cmd>Noice last<cr>",                               "Shows the last message in a popup" },
    d = { "<cmd>Noice dismiss<cr>",                            "Dismiss all visible messages" },
    e = { "<cmd>Noice erros<cr>",                              "Shows the error messages in a split" },
    t = { "<cmd>Noice telescope<cr>",                          "Opens message history in Telescope" },
  },

  s = {
    name = "Search",
    b = { "<cmd>Telescope git_branches<cr>",                   "Checkout branch" },
    c = { "<cmd>Telescope colorscheme<cr>",                    "Colorscheme" },
    h = { "<cmd>Telescope help_tags<cr>",                      "Find Help" },
    M = { "<cmd>Telescope man_pages<cr>",                      "Man Pages" },
    r = { "<cmd>Telescope oldfiles<cr>",                       "Open Recent File" },
    R = { "<cmd>Telescope registers<cr>",                      "Registers" },
    k = { "<cmd>Telescope keymaps<cr>",                        "Keymaps" },
    C = { "<cmd>Telescope commands<cr>",                       "Commands" },
  },

  t = {
  name = "+Trouble",
    r = { "<cmd>Trouble lsp_references<cr>",                   "References" },
    f = { "<cmd>Trouble lsp_definitions<cr>",                  "Definitions" },
    d = { "<cmd>Trouble document_diagnostics<cr>",             "Diagnostics" },
    q = { "<cmd>Trouble quickfix<cr>",                         "QuickFix" },
    l = { "<cmd>Trouble loclist<cr>",                          "LocationList" },
    w = { "<cmd>Trouble workspace_diagnostics<cr>",            "Workspace Diagnostics" },
  },

  u = {
    name = "+Utils",
    d = { ":call DeleteEndingWhiteSpace()<cr>",                "Remove Trailing Whitespaces" },
    f = { ":%!jq .<CR>",                                       "Format Json" },
    u = { "<cmd>set ff=unix<cr>",                              "dos2unix" },
    w = { "<cmd>set ff=dos<cr>",                               "unix2dos" },
    c = { ":Inspect<CR>",                                      "Capture Highlights Under Cursor"},
    p = { "<cmd>lua _PYTHON_TOGGLE()<cr>",                     "Python" },
  },

  o = {
    name = "Toggle Display Options",
    c = { ":lua require('config.functions').ToggleColourCursorColumn()<CR>",          "Toggle cursor Column visibility"},
    e = { ":lua require('config.functions').ToggleColourWhiteSpaceAtEndOfLine()<CR>", "Toggle whitespace at End of line visibility"},
    d = { "<cmd>DocsViewToggle<cr>",                                                  "Toggle docs-view"},
    h = { ":ColorizerToggle<CR>",                                                     "Toggle Hex colour and colour name matches"},
    i = { ":lua require('config.functions').ToggleColourIncSearch()<CR>",             "Toggle hIghlight matching words under cursor"},
    l = { ":lua require('config.functions').ToggleColourCursorLine()<CR>",            "Toggle cursor Line visibility"},
    r = { ":set wrap!<CR>",                                                           "Toggle line wRap"},
    s = { ":set spell!<CR>",                                                          "Toggle Spell checking"},
    t = { ":lua require('config.functions').ToggleColourLineTooLong()<CR>",           "Toggle line Too long highlighting"},
    w = { ":set list!<CR>",                                                           "Toggle Whitespace visibility"},
    y = { ":lua require('config.functions').ToggleColourSyntax()<CR>",                "Toggle sYntax highlighting"},
    R = { ":set relativenumber!<CR>",                                                 "Toggle Relativenumbers"}
  },

  j = {
    name = "Show/Jump various dev info",
    h = { ":lua require('config.functions').OpenHelpPage()<CR>",                          "Jump vim Help page for word under cursor"},
    m = { ":<C-U>exe 'Man' v:count '<C-R><C-W>'<CR>",          "Jump linux Man page for word under cursor"},
  },

  r = {
    name = "RipGrep",
    g = { ":Rg<CR>",                                           "Ripgrep Prompt"},
    w = { ":Rg <cword><CR>",                                   "Search for word under the cursor"}
  },
}

return M
