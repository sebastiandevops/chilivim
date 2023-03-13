return {
	settings = {

		Lua = {
			diagnostics = {
				globals = { "vim" },
			},
			workspace = {
				library = {
					[vim.fn.expand("$VIMRUNTIME/lua")] = true,
					[vim.fn.stdpath("config") .. "/lua"] = true,
          checkThirdParty = false, -- THIS IS THE IMPORTANT LINE TO ADD
				},
			},
      -- Do not send telemetry data containing a randomized but unique identifier
      telemetry = {
        enable = false,
      },

		},
	},
}
