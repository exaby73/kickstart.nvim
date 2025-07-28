-- nvim-hlslens: Enhanced search experience with virtual text
-- Shows match count and index at current search position
-- Integrates with native search commands (n, N, *, #) for better visibility

return {
  {
    'kevinhwang91/nvim-hlslens',
    config = function()
      require('hlslens').setup {
        calm_down = true,
        nearest_only = true,
        nearest_float_when = 'always',
      }

      local kopts = { noremap = true, silent = true }

      vim.api.nvim_set_keymap('n', 'n', [[<Cmd>execute('normal! ' . v:count1 . 'n')<CR><Cmd>lua require('hlslens').start()<CR>]], kopts)
      vim.api.nvim_set_keymap('n', 'N', [[<Cmd>execute('normal! ' . v:count1 . 'N')<CR><Cmd>lua require('hlslens').start()<CR>]], kopts)
      vim.api.nvim_set_keymap('n', '*', [[*<Cmd>lua require('hlslens').start()<CR>]], kopts)
      vim.api.nvim_set_keymap('n', '#', [[#<Cmd>lua require('hlslens').start()<CR>]], kopts)
      vim.api.nvim_set_keymap('n', 'g*', [[g*<Cmd>lua require('hlslens').start()<CR>]], kopts)
      vim.api.nvim_set_keymap('n', 'g#', [[g#<Cmd>lua require('hlslens').start()<CR>]], kopts)

      vim.api.nvim_set_keymap('n', '<Leader>l', '<Cmd>noh<CR>', kopts)
    end,
  },
}

