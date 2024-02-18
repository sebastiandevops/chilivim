local M ={}

function M.OpenHelpPage()
  local help_word = vim.fn.expand('<cword>')
  vim.cmd(":help " .. help_word)
end

function M.DeleteEndingWhiteSpace()
    -- Save the current cursor position
    local current_position = vim.fn.getpos(".")
    -- Store the last search pattern
    local reg = vim.fn.getreg("/")
    -- Perform the whitespace removal using a global substitute command
    vim.cmd("%s/\\s*$//g")
    -- Restore the search pattern
    vim.fn.setreg("/", reg)
    -- Restore the cursor position
    vim.fn.setpos(".", current_position)
end

-- Toggle Cursor Column
function M.ToggleColourCursorColumn()
    if vim.o.cursorcolumn then
        vim.o.cursorcolumn = false
    else
        vim.o.cursorcolumn = true
        vim.cmd("highlight CursorColumn guifg=#ffffff guibg=#403d52")
    end
end

-- Toggle Cursor Line
function M.ToggleColourCursorLine()
    if vim.o.cursorline then
        vim.o.cursorline = false
    else
        vim.o.cursorline = true
        vim.cmd("highlight CursorLine guibg=#605555")
    end
end

-- Toggle Color Column for Line Length
function M.ToggleColourLineTooLong()
    if vim.o.colorcolumn == "0" then
        vim.o.colorcolumn = "80,120"
        vim.cmd("highlight longLine guibg=#5F3F3F")
    else
        vim.o.colorcolumn = "0"
        vim.cmd("highlight longLine NONE")
    end
end

-- Toggle Color for Trailing Whitespace
function M.ToggleColourWhiteSpaceAtEndOfLine()
    if vim.fn.synIDattr(vim.fn.hlID("extraWhitespace"), "bg", "gui") == "Red" then
        vim.cmd("highlight extraWhitespace NONE")
    else
        vim.cmd("highlight extraWhitespace guibg=Red")
    end
end

-- Toggle Git Blame Highlighting
local blameline = true
function M.ToggleColourGitBlame()
    if blameline then
        blameline = false
    else
        blameline = true
    end
    vim.cmd("lua require('gitsigns').toggle_current_line_blame()")
end

-- Toggle Syntax Highlighting
function M.ToggleColourSyntax()
    if vim.g.syntax_on then
        vim.cmd("syntax off")
    else
        vim.cmd("syntax enable")
    end
end

-- Toggle Incremental Search Highlight
function M.ToggleColourIncSearch()
    if vim.fn.synIDattr(vim.fn.hlID("IncSearch"), "bg", "gui") == "#3f1f1f" then
        vim.cmd("highlight IncSearch NONE")
    else
        vim.cmd("highlight IncSearch gui=bold guibg=NONE")
    end
end

-- Define the function to execute CopilotChat with an argument
function M.copilot_chat_with_text(text)
    -- Escape single quotes in the text argument
    text = text:gsub("'", "'\\''")
    -- Execute the CopilotChat command with the provided text
    vim.cmd("CopilotChat '" .. text .. "'")
end

return M
