-- trouble.nvim: Pretty diagnostics, references, telescope results, quickfix and location list
-- Provides a better UI for viewing and navigating diagnostics and LSP information
-- Groups and filters results with preview and navigation capabilities

return {
  'folke/trouble.nvim',
  cmd = { 'Trouble', 'TroubleToggle' },
  opts = {
    use_diagnostic_signs = true,
  },
  keys = {
    {
      '<leader>cd',
      '<cmd>Trouble diagnostics toggle<cr>',
      desc = '[D]iagnostics (Trouble)',
    },
    {
      '<leader>cD',
      '<cmd>Trouble diagnostics toggle filter.buf=0<cr>',
      desc = 'Buffer [D]iagnostics (Trouble)',
    },
    {
      '<leader>cs',
      '<cmd>Trouble symbols toggle focus=false<cr>',
      desc = '[S]ymbols (Trouble)',
    },
    {
      '<leader>cl',
      '<cmd>Trouble lsp toggle focus=false win.position=right<cr>',
      desc = '[L]SP Definitions / references / ...',
    },
    {
      '<leader>cL',
      '<cmd>Trouble loclist toggle<cr>',
      desc = '[L]ocation List (Trouble)',
    },
    {
      '<leader>cQ',
      '<cmd>Trouble qflist toggle<cr>',
      desc = '[Q]uickfix List (Trouble)',
    },
  },
}
