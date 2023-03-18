local status_ok, neogen = pcall(require, "neogen")
if not status_ok then
  return
end

neogen.setup {
  snippet_engine = "luasnip",
  enabled = true,             --if you want to disable Neogen
  input_after_comment = true, -- (default: true) automatic jump (with insert mode) on inserted annotation
  languages = {
    lua = {
      template = {
        annotation_convention = "emmylua" -- for a full list of annotation_conventions, see supported-languages below,
        }
    },
    python = {
      template = {
        annotation_convention = "google_docstrings"
      }
    },
    sh = {
      template = {
        annotation_convention = "google_bash"
      }
    },
    java = {
      template = {
        annotation_convention = "javadoc"
      }
    },
  }
}
