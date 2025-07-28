-- nvim-colorizer.lua: Fastest Neovim colorizer - highlights color codes in your files
-- Shows color previews for hex codes, RGB values, CSS colors, and Tailwind classes
-- Displays colors as background highlights or virtual text

return {
  'NvChad/nvim-colorizer.lua',
  event = { 'BufReadPre', 'BufNewFile' },
  config = function()
    require('colorizer').setup {
      filetypes = { '*' },
      user_default_options = {
        RGB = true,
        RRGGBB = true,
        names = false,
        RRGGBBAA = true,
        AARRGGBB = false,
        rgb_fn = true,
        hsl_fn = true,
        css = true,
        css_fn = true,
        mode = 'background',
        tailwind = true,
        sass = { enable = true, parsers = { 'css' } },
        virtualtext = '■',
      },
      buftypes = {},
    }
  end,
}
