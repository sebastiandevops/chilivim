return {
  settings = {
    pylsp = {
      plugins = {
        pycodestyle = {
          ignore = {'W391'},
          maxLineLength = 100
        },
        flake8 = {
          enabled = true,
        }
      }
    }
  }
}
