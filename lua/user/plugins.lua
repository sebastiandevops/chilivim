-- Config {{{1
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)
-- }}}1

vim.g.mapleader = " "
vim.g.maplocalleader = " "
require('lazy').setup('plugins')
  -- }}}1
-- Plugins Config {{{1
vim.keymap.set({ 'n' }, '<C-k>', function()       require('lsp_signature').toggle_float_win()
end, { silent = true, noremap = true, desc = 'toggle signature' })

vim.keymap.set({ 'n' }, '<Leader>k', function()
 vim.lsp.buf.signature_help()
end, { silent = true, noremap = true, desc = 'toggle signature' })


-- }}}1

