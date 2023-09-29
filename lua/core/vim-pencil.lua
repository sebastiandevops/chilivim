local M = {}

function M.config()
  vim.g["pencil#wrapModeDefault"] = 'hard'
  vim.g["pencil#autoformat"] = 0
  vim.g["pencil#textwidth"] = 80
  vim.g["pencil#cursorwrap"] = 1

  vim.cmd([[
    augroup pencil
    autocmd!
    autocmd FileType markdown,mkd,yaml,norg
          \ call pencil#init({'wrap': 'soft', 'autoformat': 0})
    autocmd FileType text
          \ call pencil#init({'wrap': 'soft', 'autoformat': 0})
    augroup END
  ]])
end

return M
