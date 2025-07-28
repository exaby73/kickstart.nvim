-- inc-rename.nvim: Incremental LSP rename with live preview
-- Shows real-time preview of rename changes across all affected files
-- Provides visual feedback before confirming the rename operation

return {
  'smjonas/inc-rename.nvim',
  cmd = 'IncRename',
  config = true,
  keys = {
    {
      '<leader>cR',
      function()
        return ':IncRename ' .. vim.fn.expand '<cword>'
      end,
      expr = true,
      desc = '[R]ename',
    },
  },
}

