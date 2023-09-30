local status_ok, colorizer = pcall(require, "colorizer")
if not status_ok then
  return
end

local default_options = {
  names    = true,
  RGB      = true, -- #RGB hex codes
  RRGGBB   = true, -- #RRGGBB hex codes
  RRGGBBAA = true, -- #RRGGBBAA hex codes
  rgb_fn   = true, -- CSS rgb() and rgba() functions
  hsl_fn   = true, -- CSS hsl() and hsla() functions
  css      = true, -- Enable all CSS features: rgb_fn, hsl_fn, names, RGB, RRGGBB
  css_fn   = true, -- Enable all CSS *functions*: rgb_fn, hsl_fn
  mode     = 'background',
}

colorizer.setup {
  css        = { default_options },
  scss       = { default_options },
  html       = { default_options },
  javascript = { default_options },
}
