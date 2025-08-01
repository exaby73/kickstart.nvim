-- Comment.nvim: Smart and powerful comment plugin for Neovim
-- Supports line and block comments with context-aware commentstring detection
-- Integrates with treesitter for accurate commenting in embedded languages

return {
  'numToStr/Comment.nvim',
  event = { 'BufReadPre', 'BufNewFile' },
  dependencies = {
    'JoosepAlviste/nvim-ts-context-commentstring',
  },
  config = function()
    local comment = require 'Comment'
    local ts_context_commentstring = require 'ts_context_commentstring.integrations.comment_nvim'

    ---@diagnostic disable-next-line: missing-fields
    comment.setup {
      pre_hook = ts_context_commentstring.create_pre_hook(),
    }
  end,
}