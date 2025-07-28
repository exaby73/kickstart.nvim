-- lualine.nvim: Fast and customizable statusline for Neovim
-- Displays mode, git info, diagnostics, file info, and navigation breadcrumbs
-- Integrates with various plugins like gitsigns, navic, and noice

return {
  'nvim-lualine/lualine.nvim',
  dependencies = { 'nvim-tree/nvim-web-devicons' },
  event = 'VeryLazy',
  opts = {
    options = {
      theme = 'tokyonight',
      component_separators = '|',
      section_separators = '',
      globalstatus = true,
      disabled_filetypes = { statusline = { 'dashboard', 'alpha', 'starter' } },
    },
    sections = {
      lualine_a = { 'mode' },
      lualine_b = { 'branch' },
      lualine_c = {
        {
          'diagnostics',
          symbols = {
            error = ' ',
            warn = ' ',
            info = ' ',
            hint = ' ',
          },
        },
        { 'filetype', icon_only = true, separator = '', padding = { left = 1, right = 0 } },
        {
          'filename',
          path = 1,
          symbols = {
            modified = '  ',
            readonly = '  ',
            unnamed = '  ',
          },
        },
        {
          function()
            return require('nvim-navic').get_location()
          end,
          cond = function()
            return package.loaded['nvim-navic'] and require('nvim-navic').is_available()
          end,
        },
      },
      lualine_x = {
        {
          function()
            ---@diagnostic disable-next-line: undefined-field
            return require('noice').api.status.command.get()
          end,
          cond = function()
            ---@diagnostic disable-next-line: undefined-field
            return package.loaded['noice'] and require('noice').api.status.command.has()
          end,
          color = { fg = '#ff9e64' },
        },
        {
          function()
            ---@diagnostic disable-next-line: undefined-field
            return require('noice').api.status.mode.get()
          end,
          cond = function()
            ---@diagnostic disable-next-line: undefined-field
            return package.loaded['noice'] and require('noice').api.status.mode.has()
          end,
          color = { fg = '#ff9e64' },
        },
        {
          'diff',
          symbols = {
            added = ' ',
            modified = ' ',
            removed = ' ',
          },
          source = function()
            local gitsigns = vim.b.gitsigns_status_dict
            if gitsigns then
              return {
                added = gitsigns.added,
                modified = gitsigns.changed,
                removed = gitsigns.removed,
              }
            end
          end,
        },
      },
      lualine_y = {
        { 'progress', separator = ' ', padding = { left = 1, right = 0 } },
        { 'location', padding = { left = 0, right = 1 } },
      },
      lualine_z = {
        function()
          return ' ' .. os.date '%R'
        end,
      },
    },
    extensions = { 'neo-tree', 'lazy' },
  },
}