-- LuaSnip configuration
local ls = require 'luasnip'

-- Configure LuaSnip
ls.config.set_config {
  -- This tells LuaSnip to remember to keep around the last snippet.
  -- You can jump back into it even if you move outside of the selection
  history = true,
  -- This one is cool cause if you have dynamic snippets, it updates as you type!
  updateevents = 'TextChanged,TextChangedI',
  -- Autosnippets:
  enable_autosnippets = true,
}

-- Load snippets from different sources
-- Load VSCode-style snippets from friendly-snippets (if you enable it)
-- require('luasnip.loaders.from_vscode').lazy_load()

-- Load snippets from the snippets directory
require('luasnip.loaders.from_lua').lazy_load { paths = { vim.fn.stdpath 'config' .. '/lua/custom/snippets' } }

-- Manually register snippets
ls.add_snippets('dart', require('custom.snippets.dart'))

-- You can also load snippets from a dedicated snippets folder
-- require('luasnip.loaders.from_snipmate').lazy_load({ paths = vim.fn.stdpath('config') .. '/snippets' })

-- Keymaps for snippet navigation
vim.keymap.set({ 'i', 's' }, '<C-l>', function()
  if ls.expand_or_jumpable() then
    ls.expand_or_jump()
  end
end, { desc = 'LuaSnip: Expand or jump forward' })

vim.keymap.set({ 'i', 's' }, '<C-h>', function()
  if ls.jumpable(-1) then
    ls.jump(-1)
  end
end, { desc = 'LuaSnip: Jump backward' })

vim.keymap.set({ 'i', 's' }, '<C-e>', function()
  if ls.choice_active() then
    ls.change_choice(1)
  end
end, { desc = 'LuaSnip: Next choice' })

-- Return snippet tables for different filetypes
-- You can add your snippets here or in separate files
return {
  -- Example: Add snippets directly here
  -- lua = {
  --   s('fn', fmt('function {}({})\n  {}\nend', { i(1, 'name'), i(2), i(0) })),
  -- },
}

