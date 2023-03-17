local status_ok, filetype = pcall(require, "filetype")
if not status_ok then
  return
end

filetype.setup {
  overrides = {
    extensions = {
        -- Set the filetype of *.pn files to potion
      pn = "potion",
      tf = "terraform",
      tfvars = "terraform",
      tfstate = "json",
    },
  },
}
