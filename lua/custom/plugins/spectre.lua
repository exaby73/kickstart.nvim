-- nvim-spectre: Search and replace panel for Neovim
-- Provides powerful find and replace across multiple files with live preview
-- Supports regex patterns and file filtering for targeted replacements

return {
  'nvim-pack/nvim-spectre',
  build = false,
  cmd = 'Spectre',
  opts = { open_cmd = 'noswapfile vnew' },
  keys = {
    {
      '<leader>sR',
      function()
        require('spectre').open()
      end,
      desc = 'Replace in files (Spectre)',
    },
  },
}