return {
  'dnlhc/glance.nvim',
  cmd = { 'Glance' },
  config = function()
    ---@diagnostic disable-next-line: missing-fields
    require('glance').setup {
      height = 18,
      zindex = 45,
      ---@diagnostic disable-next-line: missing-fields
      preview_win_opts = {
        cursorline = true,
        number = true,
        wrap = true,
      },
      border = {
        enable = true,
        top_char = '―',
        bottom_char = '―',
      },
      list = {
        position = 'right',
        width = 0.33,
      },
      theme = {
        enable = true,
        mode = 'auto',
      },
      mappings = {
        list = {
          ['j'] = require('glance').actions.next,
          ['k'] = require('glance').actions.previous,
          ['<Down>'] = require('glance').actions.next,
          ['<Up>'] = require('glance').actions.previous,
          ['<Tab>'] = require('glance').actions.next_location,
          ['<S-Tab>'] = require('glance').actions.previous_location,
          ['<C-u>'] = require('glance').actions.preview_scroll_win(5),
          ['<C-d>'] = require('glance').actions.preview_scroll_win(-5),
          ['v'] = require('glance').actions.jump_vsplit,
          ['s'] = require('glance').actions.jump_split,
          ['t'] = require('glance').actions.jump_tab,
          ['<CR>'] = require('glance').actions.jump,
          ['o'] = require('glance').actions.jump,
          ['<leader>l'] = require('glance').actions.enter_win 'preview',
          ['q'] = require('glance').actions.close,
          ['Q'] = require('glance').actions.close,
          ['<Esc>'] = require('glance').actions.close,
        },
        preview = {
          ['Q'] = require('glance').actions.close,
          ['<Tab>'] = require('glance').actions.next_location,
          ['<S-Tab>'] = require('glance').actions.previous_location,
          ['<leader>l'] = require('glance').actions.enter_win 'list',
        },
      },
      folds = {
        fold_closed = '',
        fold_open = '',
        folded = true,
      },
      indent_lines = {
        enable = true,
        icon = '│',
      },
      winbar = {
        enable = true,
      },
    }
  end,
  keys = {
    { 'gD', '<cmd>Glance definitions<cr>', desc = 'Glance definitions' },
    { 'gR', '<cmd>Glance references<cr>', desc = 'Glance references' },
    { 'gY', '<cmd>Glance type_definitions<cr>', desc = 'Glance type definitions' },
    { 'gM', '<cmd>Glance implementations<cr>', desc = 'Glance implementations' },
  },
}
