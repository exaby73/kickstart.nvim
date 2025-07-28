-- Load core modules
require 'options'
require 'core.keymaps'
require 'core.autocommands'

-- Bootstrap lazy.nvim
require 'core.lazy_bootstrap'

-- Setup plugins
require('lazy').setup({
  -- Kickstart plugins
  { import = 'kickstart.plugins' },

  -- Custom plugins
  { import = 'custom.plugins' },
}, {
  ui = {
    icons = vim.g.have_nerd_font and {} or {
      cmd = '⌘',
      config = '🛠',
      event = '📅',
      ft = '📂',
      init = '⚙',
      keys = '🗝',
      plugin = '🔌',
      runtime = '💻',
      require = '🌙',
      source = '📄',
      start = '🚀',
      task = '📌',
      lazy = '💤 ',
    },
  },
})

-- vim: ts=2 sts=2 sw=2 et

