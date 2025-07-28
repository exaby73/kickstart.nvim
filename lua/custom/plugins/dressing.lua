return {
  'stevearc/dressing.nvim',
  lazy = true,
  init = function()
    local original_select = vim.ui.select
    local original_input = vim.ui.input

    ---@diagnostic disable-next-line: duplicate-set-field
    vim.ui.select = function(...)
      require('lazy').load { plugins = { 'dressing.nvim' } }
      vim.ui.select = original_select
      return vim.ui.select(...)
    end

    ---@diagnostic disable-next-line: duplicate-set-field
    vim.ui.input = function(...)
      require('lazy').load { plugins = { 'dressing.nvim' } }
      vim.ui.input = original_input
      return vim.ui.input(...)
    end
  end,
}
