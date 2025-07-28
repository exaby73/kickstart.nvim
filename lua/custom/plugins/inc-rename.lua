return {
  'smjonas/inc-rename.nvim',
  cmd = 'IncRename',
  config = true,
  keys = {
    {
      '<leader>cr',
      function()
        return ':IncRename ' .. vim.fn.expand '<cword>'
      end,
      expr = true,
      desc = '[R]ename',
    },
  },
}