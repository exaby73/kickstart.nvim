-- Diffview.nvim: Single tabpage interface for easily cycling through diffs
-- Provides Git diff viewing, file history, and merge conflict resolution
-- Supports side-by-side diffs and integration with Git operations

return {
  'sindrets/diffview.nvim',
  dependencies = 'nvim-lua/plenary.nvim',
  cmd = { 'DiffviewOpen', 'DiffviewClose', 'DiffviewToggleFiles', 'DiffviewFocusFiles' },
  config = true,
  keys = {
    { '<leader>gd', '<cmd>DiffviewOpen<cr>', desc = 'Open [D]iffview' },
    { '<leader>gc', '<cmd>DiffviewClose<cr>', desc = '[C]lose Diffview' },
    { '<leader>gh', '<cmd>DiffviewFileHistory %<cr>', desc = 'File [H]istory' },
    { '<leader>gH', '<cmd>DiffviewFileHistory<cr>', desc = 'Branch [H]istory' },
  },
}