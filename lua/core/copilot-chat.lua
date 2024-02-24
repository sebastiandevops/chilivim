local M = {}

M.options = {
  show_help = "yes", -- Show help text for CopilotChatInPlace, default: yes
  debug = true, -- Enable or disable debug mode, the log file will be in ~/.local/state/nvim/CopilotChat.nvim.log
  hide_system_prompt = "yes", -- Hide system prompt text for CopilotChat
  -- disable_extra_info = 'no', -- Disable extra information (e.g: system prompt) in the response.
  language = "English",
  --
  prompts = {
    Explain = "Explain how it works.",
    Review = "Review the following code and provide concise suggestions.",
    Tests = "Briefly explain how the selected code works, then generate unit tests.",
    Refactor = "Refactor the code to improve clarity and readability.",
  },
}

function M.build_function()
  vim.notify("Please update the remote plugins by running ':UpdateRemotePlugins', then restart Neovim.")
end

M.keymaps = {
  { "<leader>xb",
    function()
      local input = vim.fn.input("Chat with buffer: ")
      if input ~= "" then
        vim.cmd("CopilotChatBuffer " .. input)
      end
    end,
    desc = "CopilotChat - Chat with current buffer",
  },
  { "<leader>xe", "<cmd>CopilotChatExplain<cr>", desc = "CopilotChat - Explain code" },
  -- { "<leader>xt", "<cmd>CopilotChatTests<cr>", desc = "CopilotChat - Generate tests" },
  -- Create input for CopilotChat
  {
    "<leader>xi",
    function()
      local input = vim.fn.input("Ask Copilot: ")
      if input ~= "" then
        vim.cmd("CopilotChat " .. input)
      end
    end,
    desc = "CopilotChat - Ask input",
  },
  -- { "<leader>xr", "<cmd>CopilotChatReview<cr>", desc = "CopilotChat - Review code" },
  { "<leader>xR", "<cmd>CopilotChatRefactor<cr>", desc = "CopilotChat - Refactor code" },
  -- Quick chat with Copilot
  {
    "<leader>xq",
    function()
      local input = vim.fn.input("Quick Chat: ")
      if input ~= "" then
        vim.cmd("CopilotChatBuffer " .. input)
      end
    end,
    desc = "CopilotChat - Quick chat",
  },
}

return M
