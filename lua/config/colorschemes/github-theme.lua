return {
  options = {
    transparent = true,
    styles = {
      functions = "Italic",
    },
    darken = {
      floats = true,
      sidebars = {
        enable = true,
        list = {"qf", "vista_kind", "terminal", "packer"},
      },
    },
  },
  -- Change the "hint" color to the "orange" color, and make the "error" color bright red
  palettes = {
    all = {
      diag = {
        hint = "orange",
        error = "#ff0000",
      },
    },
  },

  -- Overwrite the highlight groups
  groups = function(c)
    return {
      htmlTag = {fg = c.red, bg = "#282c34", sp = c.hint, style = "underline"},
      LineNr = {fg = "#56526e"},
      DiagnosticHint = {link = "LspDiagnosticsDefaultHint"},
      -- this will remove the highlight groups
      TSField = {},
    }
  end
}
