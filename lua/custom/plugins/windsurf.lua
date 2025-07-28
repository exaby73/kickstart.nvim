-- windsurf.nvim: Codeium AI code completion and chat for Neovim
-- Provides AI-powered code suggestions and interactive chat interface
-- Supports virtual text completions with customizable key bindings

return {
  'Exafunction/windsurf.nvim',
  event = 'VeryLazy',
  dependencies = {
    'nvim-lua/plenary.nvim',
    'hrsh7th/nvim-cmp',
  },
  config = function()
    require('codeium').setup {
      enable_chat = true,
      enable_cmp_source = false, -- Disable cmp integration
      virtual_text = {
        enabled = true,
        manual = false,
        filetypes = {},
        default_filetype_enabled = true,
        idle_delay = 75,
        virtual_text_priority = 65535,
        map_keys = true,
        accept_fallback = nil,
        key_bindings = {
          accept = '<Tab>',
          accept_word = '<C-Right>',
          accept_line = '<C-Down>',
          clear = '<C-]>',
          next = '<C-n>',
          prev = '<C-p>',
        },
      },
      enable_local_search = false,
      enable_index_service = false,
      search_max_workspace_file_count = 5000,
    }
  end,
  keys = {
    -- Chat commands
    { '<leader>cc', '<cmd>Codeium Chat<cr>', desc = 'Open Codeium Chat' },
  },
}
