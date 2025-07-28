-- aerial.nvim: A code outline window for skimming and quick navigation
-- Provides a sidebar with tree-like view of symbols in your code (functions, classes, methods, etc.)
-- Supports multiple backends including LSP, treesitter, and markdown
return {
  'stevearc/aerial.nvim',
  dependencies = {
    'nvim-treesitter/nvim-treesitter',
    'nvim-tree/nvim-web-devicons',
  },
  opts = {
    attach_mode = 'window',
    backends = { 'lsp', 'treesitter', 'markdown', 'asciidoc', 'man' },
    layout = {
      max_width = { 40, 0.2 },
      width = nil,
      min_width = 20,
      default_direction = 'prefer_right',
    },
    show_guides = true,
    filter_kind = false,
    guides = {
      mid_item = '├─',
      last_item = '└─',
      nested_top = '│ ',
      whitespace = '  ',
    },
  },
  keys = {
    { '<leader>co', '<cmd>AerialToggle<CR>', desc = 'Code [O]utline' },
    { '<leader>cO', '<cmd>AerialNavToggle<CR>', desc = 'Code [O]utline Nav' },
  },
}