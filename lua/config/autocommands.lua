local autocmd = vim.api.nvim_create_autocmd

autocmd({ "FileType" }, {
  pattern = { "qf", "help", "man", "lspinfo", "spectre_panel" },
  callback = function()
    vim.cmd [[
      nnoremap <silent> <buffer> q :close<CR>
      set nobuflisted
    ]]
  end,
})

autocmd({ "FileType" }, {
  pattern = { "gitcommit", "markdown" },
  callback = function()
    vim.opt_local.wrap = true
    vim.opt_local.spell = true
  end,
})

autocmd({ "FileType" }, {
  pattern = {
    "help",
    "startuptime",
    "qf",
    "lspinfo",
    "vim",
    "OverseerList",
    "OverseerForm",
    "fugitive",
    "FTerm",
    "floggraph",
    "git",
    "cheat",
    "Jaq",
    "Outline"
  },
  callback = function()
    vim.opt_local.spell = false
  end,
})

-- Automatically close tab/vim when nvim-tree is the last window in the tab
vim.cmd "autocmd BufEnter * ++nested if winnr('$') == 1 && bufname() == 'NvimTree_' . tabpagenr() | quit | endif"

autocmd({ "VimResized" }, {
  callback = function()
    vim.cmd "tabdo wincmd ="
  end,
})

autocmd({ "CmdWinEnter" }, {
  callback = function()
    vim.cmd "quit"
  end,
})

autocmd({ "TextYankPost" }, {
  callback = function()
    vim.highlight.on_yank { higroup = "Visual", timeout = 200 }
  end,
})

autocmd({ "BufWritePost" }, {
  pattern = { "*.java" },
  callback = function()
    vim.lsp.codelens.refresh()
  end,
})

autocmd({ "VimEnter" }, {
  callback = function()
    vim.cmd "hi link illuminatedWord LspReferenceText"
  end,
})

autocmd({ "BufWinEnter" }, {
  callback = function()
    local line_count = vim.api.nvim_buf_line_count(0)
    if line_count >= 5000 then
      vim.cmd "IlluminatePauseBuf"
    end
  end,
})

autocmd("BufEnter", {
  pattern = { "*" },
  -- enable wrap mode for json files only
  command = "setlocal wrap",
})

autocmd("FileType", {
  pattern = "zsh",
  callback = function()
    -- let treesitter use bash highlight for zsh files as well
    require("nvim-treesitter.highlight").attach(0, "bash")
  end,
})

autocmd("FileType", {
  pattern = "Jenkinsfile",
  callback = function()
    -- let treesitter use bash highlight for zsh files as well
    require("nvim-treesitter.highlight").attach(0, "groovy")
  end,
})

-- windows to close with "q"
autocmd("FileType", {
  pattern = {
    "help",
    "startuptime",
    "qf",
    "lspinfo",
    "vim",
    "OverseerList",
    "OverseerForm",
    "fugitive",
    "FTerm",
    "floggraph",
    "git",
    "cheat",
    "Jaq",
    "Outline"
  },
  command = "nnoremap <buffer><silent> q :bdelete!<CR>",
})

-- don't auto comment new line
autocmd("BufEnter", { command = [[set formatoptions-=cro]] })

-- Autoinsert python shebang
autocmd("BufNewFile", {
  pattern = "*.py",
  command = "exec 'normal i#!/usr/bin/env python3\n'",
})

-- Autoinsert bash shebang
autocmd("BufNewFile", {
  pattern = "*.sh",
  command = "exec 'normal i#!/usr/bin/env bash\n'",
})

-- Terraform configuration
vim.cmd([[silent! autocmd! filetypedetect BufRead,BufNewFile *.tf]])
autocmd({"BufRead", "BufNewFile"}, {
  pattern = {
    "*.hcl",
    "*.terraform",
    "terraform.rc",
  },
  command = "set filetype=hcl"
})

autocmd({"BufRead", "BufNewFile"}, {
  pattern = {
    "*.tf",
    "*.tfvars",
  },
  command = "set filetype=terraform"
})

autocmd({"BufRead", "BufNewFile"}, {
  pattern = {
    "*.tfstate",
    "*.tfstate.backup",
  },
  command = "set filetype=json"
})

vim.cmd([[let g:terraform_fmt_on_save=1]])
vim.cmd([[let g:terraform_align=1]])
-- End of terraform config.

autocmd({ "BufWritePre" }, {
  pattern = { "*" },
  -- command = [[%s/\s\+$//e]],
  command = ":call DeleteEndingWhiteSpace()"
})

vim.cmd([[let g:nvim_tree_respect_buf_cwd=1]])
