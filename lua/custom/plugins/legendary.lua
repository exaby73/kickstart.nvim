-- legendary.nvim: Command palette and keymap browser for Neovim
-- Provides searchable interface for commands, keymaps, and autocmds with frecency sorting
-- Integrates with which-key for automatic keymap discovery

return {
  'mrjones2014/legendary.nvim',
  priority = 10000,
  lazy = false,
  dependencies = { 'kkharji/sqlite.lua' },
  config = function()
    require('legendary').setup {
      keymaps = {},
      commands = {},
      autocmds = {},
      extensions = {
        which_key = {
          auto_register = true,
        },
      },
      scratchpad = {
        view = 'float',
        results_view = 'float',
      },
      sort = {
        most_recent_first = true,
        frecency = {
          db_root = vim.fn.stdpath 'data' .. '/legendary/',
          max_timestamps = 10,
        },
      },
    }
  end,
  keys = {
    { '<C-S-p>', '<cmd>Legendary<cr>', desc = 'Command Palette' },
    { '<leader>?', '<cmd>Legendary<cr>', desc = 'Command Palette' },
  },
}