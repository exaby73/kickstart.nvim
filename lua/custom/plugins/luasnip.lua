-- LuaSnip: Powerful snippet engine for Neovim written in Lua
-- Provides advanced snippet expansion with placeholders and transformations
-- Configured with custom snippets loaded from separate module

return {
  {
    'L3MON4D3/LuaSnip',
    config = function()
      require('custom.snippets')
    end,
  },
}