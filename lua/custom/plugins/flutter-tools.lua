return {
  'nvim-flutter/flutter-tools.nvim',
  lazy = false,
  dependencies = {
    'nvim-lua/plenary.nvim',
    'stevearc/dressing.nvim', -- optional for vim.ui.select
  },
  config = function(_, opts)
    require('flutter-tools').setup(vim.tbl_deep_extend('force', opts or {}, {
      flutter_lookup_cmd = 'asdf which flutter',
    }))
  end,
}
