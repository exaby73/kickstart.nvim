-- bufferline.nvim: A snazzy buffer line (with tabpage integration) for Neovim
-- Shows open buffers as tabs at the top of the window with diagnostics integration
-- Provides easy buffer navigation and management with mouse support

return {
  'akinsho/bufferline.nvim',
  version = '*',
  dependencies = 'nvim-tree/nvim-web-devicons',
  event = 'VeryLazy',
  keys = {
    { '<leader>bp', '<cmd>BufferLineTogglePin<CR>', desc = 'Toggle [P]in' },
    { '<leader>bP', '<cmd>BufferLineGroupClose ungrouped<CR>', desc = 'Delete non-[P]inned buffers' },
    { '<leader>bo', '<cmd>BufferLineCloseOthers<CR>', desc = 'Delete [O]ther buffers' },
    { '<leader>br', '<cmd>BufferLineCloseRight<CR>', desc = 'Delete buffers to the [R]ight' },
    { '<leader>bl', '<cmd>BufferLineCloseLeft<CR>', desc = 'Delete buffers to the [L]eft' },
    { '<S-h>', '<cmd>BufferLineCyclePrev<CR>', desc = 'Prev buffer' },
    { '<S-l>', '<cmd>BufferLineCycleNext<CR>', desc = 'Next buffer' },
    { '[b', '<cmd>BufferLineCyclePrev<CR>', desc = 'Prev buffer' },
    { ']b', '<cmd>BufferLineCycleNext<CR>', desc = 'Next buffer' },
  },
  opts = {
    options = {
      close_command = function(n)
        require('mini.bufremove').delete(n, false)
      end,
      right_mouse_command = function(n)
        require('mini.bufremove').delete(n, false)
      end,
      diagnostics = 'nvim_lsp',
      always_show_bufferline = true,
      offsets = {
        {
          filetype = 'neo-tree',
          text = 'Neo-tree',
          highlight = 'Directory',
          text_align = 'left',
        },
      },
      indicator = {
        style = 'icon',
        icon = '▎',
      },
      buffer_close_icon = '󰅖',
      modified_icon = '●',
      close_icon = '',
      left_trunc_marker = '',
      right_trunc_marker = '',
      diagnostics_indicator = function(count, level, diagnostics_dict, context)
        local icon = level:match 'error' and ' ' or ' '
        return ' ' .. icon .. count
      end,
    },
  },
  config = function(_, opts)
    require('bufferline').setup(opts)
    vim.api.nvim_create_autocmd({ 'BufAdd', 'BufDelete' }, {
      callback = function()
        vim.schedule(function()
          pcall(nvim_bufferline)
        end)
      end,
    })
  end,
}
