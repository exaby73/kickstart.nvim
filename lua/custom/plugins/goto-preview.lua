return {
  'rmagatti/goto-preview',
  config = function()
    require('goto-preview').setup {
      width = 120,
      height = 15,
      border = { '↖', '─', '┐', '│', '┘', '─', '└', '│' },
      default_mappings = false,
      debug = false,
      opacity = nil,
      resizing_mappings = false,
      post_open_hook = nil,
      references = {
        telescope = require('telescope.themes').get_dropdown { hide_preview = false },
      },
      focus_on_open = true,
      dismiss_on_move = false,
      force_close = true,
      bufhidden = 'wipe',
      stack_floating_preview_windows = true,
      preview_window_title = { enable = true, position = 'left' },
    }
  end,
  keys = {
    {
      'gpd',
      function()
        require('goto-preview').goto_preview_definition {}
      end,
      desc = 'Preview definition',
    },
    {
      'gpt',
      function()
        require('goto-preview').goto_preview_type_definition {}
      end,
      desc = 'Preview type definition',
    },
    {
      'gpi',
      function()
        require('goto-preview').goto_preview_implementation {}
      end,
      desc = 'Preview implementation',
    },
    {
      'gpr',
      function()
        require('goto-preview').goto_preview_references()
      end,
      desc = 'Preview references',
    },
    {
      'gP',
      function()
        require('goto-preview').close_all_win()
      end,
      desc = 'Close all preview windows',
    },
  },
}