-- Dressing.nvim: Improves the default vim.ui interfaces
-- Provides better UI for vim.ui.select and vim.ui.input with telescope integration
-- Lazy loads when UI functions are called for optimal performance

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
