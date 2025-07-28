-- project.nvim: Automatic project management and switching
-- Detects project roots based on patterns and maintains project history
-- Integrates with Telescope for quick project switching

return {
  'ahmedkhalf/project.nvim',
  opts = {
    manual_mode = false,
    detection_methods = { 'pattern' },
    patterns = { '.git', '_darcs', '.hg', '.bzr', '.svn', 'Makefile', 'package.json', 'pubspec.yaml' },
  },
  event = 'VeryLazy',
  config = function(_, opts)
    require('project_nvim').setup(opts)
    require('telescope').load_extension 'projects'
  end,
  keys = {
    { '<leader>sp', '<cmd>Telescope projects<cr>', desc = 'Projects' },
  },
}

