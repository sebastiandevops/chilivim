local M = {}

M.options = {
  -- show_help = "yes", -- Show help text for CopilotChatInPlace, default: yes
  -- debug = false, -- Enable or disable debug mode, the log file will be in ~/.local/state/nvim/CopilotChat.nvim.log
  -- hide_system_prompt = "yes", -- Hide system prompt text for CopilotChat
  -- disable_extra_info = 'no', -- Disable extra information (e.g: system prompt) in the response.
  -- language = "English",
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
  -- Show help actions with telescope
  {
    "<leader>xch",
    function()
      require("CopilotChat.code_actions").show_help_actions()
    end,
    desc = "CopilotChat - Help actions",
  },
  -- Show prompts actions with telescope
  {
    "<leader>xcp",
    function()
      require("CopilotChat.code_actions").show_prompt_actions()
    end,
    desc = "CopilotChat - Help actions",
  },
  {
    "<leader>xcp",
    ":lua require('CopilotChat.code_actions').show_prompt_actions(true)<CR>",
    mode = "x",
    desc = "CopilotChat - Prompt actions",
  },
}

return M
