local M = {}

function M.setup()
  vim.g["pencil#wrapModeDefault"] = 'hard'
  vim.g["pencil#autoformat"] = 0
  vim.g["pencil#textwidth"] = 80
  vim.g["pencil#cursorwrap"] = 1

  vim.cmd([[
    augroup pencil
    autocmd!
    autocmd FileType markdown,mkd,yaml,norg,text
          \ call pencil#init({'wrap': 'soft', 'autoformat': 0})
    augroup END
  ]])
end

return M
