-- nvim-treesitter-context: Shows code context at the top of the buffer
-- Displays the current function/class/method context as you scroll
-- Helps maintain awareness of code structure in long files

return {
  'nvim-treesitter/nvim-treesitter-context',
  event = 'VeryLazy',
  opts = {
    enable = true,
    max_lines = 3, -- How many lines the window should span. Values <= 0 mean no limit
    min_window_height = 0, -- Minimum editor window height to enable context. Values <= 0 mean no limit
    line_numbers = true,
    multiline_threshold = 20, -- Maximum number of lines to show for a single context
    trim_scope = 'outer', -- Which context lines to discard if `max_lines` is exceeded
    mode = 'cursor', -- Line used to calculate context. Choices: 'cursor', 'topline'
    separator = nil, -- Separator between context and content. Should be a single character string, like '-'
    zindex = 20, -- The Z-index of the context window
    on_attach = nil, -- (fun(buf: integer): boolean) return false to disable attaching
  },
  keys = {
    {
      '[x',
      function()
        require('treesitter-context').go_to_context(vim.v.count1)
      end,
      desc = 'Jump to context',
    },
    {
      '<leader>tc',
      '<cmd>TSContextToggle<cr>',
      desc = 'Toggle context',
    },
  },
}