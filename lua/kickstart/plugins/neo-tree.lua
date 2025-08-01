-- Neo-tree is a Neovim plugin to browse the file system
-- https://github.com/nvim-neo-tree/neo-tree.nvim

-- Store the initial working directory
vim.g.initial_cwd = vim.g.initial_cwd or vim.fn.getcwd()

return {
  'nvim-neo-tree/neo-tree.nvim',
  version = '*',
  dependencies = {
    'nvim-lua/plenary.nvim',
    'nvim-tree/nvim-web-devicons',
    'MunifTanjim/nui.nvim',
  },
  lazy = false,
  keys = {
    { '\\', ':Neotree reveal<CR>', desc = 'NeoTree reveal', silent = true },
    { '<leader>tr', function()
        vim.cmd('Neotree dir=' .. vim.g.initial_cwd)
      end, desc = '[T]ree [R]eset to initial cwd', silent = true },
  },
  opts = {
    filesystem = {
      follow_current_file = {
        enabled = true,
        leave_dirs_open = false,
      },
      window = {
        mappings = {
          ['\\'] = 'close_window',
          ['R'] = {
            function(state)
              -- Navigate to the initial directory
              require('neo-tree.sources.manager').navigate(state.name, vim.g.initial_cwd)
            end,
            desc = 'Reset to initial cwd',
          },
        },
      },
    },
    event_handlers = {
      {
        event = 'neo_tree_buffer_enter',
        handler = function()
          vim.cmd 'highlight! Cursor blend=100'
        end,
      },
      {
        event = 'neo_tree_buffer_leave',
        handler = function()
          vim.cmd 'highlight! Cursor blend=0'
        end,
      },
    },
  },
  config = function(_, opts)
    require('neo-tree').setup(opts)

    -- Auto refresh on focus
    vim.api.nvim_create_autocmd('FocusGained', {
      pattern = '*',
      callback = function()
        require('neo-tree.sources.manager').refresh()
      end,
    })
  end,
}
