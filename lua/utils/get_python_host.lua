--- [TODO: Figure out the system Python for Neovim]
local M = {}
--- Executes a command and returns its output.
--
-- @param command The command to execute.
-- @return The output of the executed command.
function M.execute(command)
  local file = assert(io.popen(command, "r"))
  local output = file:read("*all")
  file:close()
  return output
end

--- Gets the path to the Python 3 executable.
--
-- If a virtual environment is active, it returns the Python 3 executable from the virtual environment.
-- Otherwise, it returns the system-wide Python 3 executable.
--
-- @return The path to the Python 3 executable.
function M.get_python3_host_prog()
  local virtual_env = vim.fn.exists("$VIRTUAL_ENV")
  local python3_host_prog

  if virtual_env == 1 then
    python3_host_prog = vim.fn.substitute(M.execute("which -a python3 | head -n2 | tail -n1"), "\n", '', 'g')
  else
    python3_host_prog = vim.fn.substitute(M.execute("which python3"), "\n", '', 'g')
  end
  return python3_host_prog
end

return M
