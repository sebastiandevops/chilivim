return {
    settings = {
        Lua = {
            runtime = {
            -- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
            version = 'LuaJIT',
            },
            diagnostics = {
                disable = { "missing-fields", "incomplete-signature-doc" },

            -- Get the language server to recognize the `vim` global
                globals = {'vim', 'require', 'pcall'},
            },
            workspace = {
              -- Make the server aware of Neovim runtime files
              -- library = {
              --   [vim.fn.expand("$VIMRUNTIME/lua")] = true,
              --   [vim.fn.stdpath("config") .. "/lua"] = true,
              library = vim.api.nvim_get_runtime_file("", true),
              checkThirdParty = "Disable", -- THIS IS THE IMPORTANT LINE TO ADD
              -- }
            },
            -- Do not send telemetry data containing a randomized but unique identifier
            telemetry = {
                enable = false,
            },
        },
    },
}
