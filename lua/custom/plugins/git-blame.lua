-- git-blame.nvim: Git blame annotations in virtual text
-- Shows commit author, date, and message inline for each line
-- Toggleable display with customizable formatting and keybindings

return {
  'f-person/git-blame.nvim',
  event = 'VeryLazy',
  opts = {
    enabled = false,
    message_template = ' <author> • <date> • <summary>',
    date_format = '%m/%d/%y',
    virtual_text_column = 1,
  },
  keys = {
    { '<leader>gb', '<cmd>GitBlameToggle<cr>', desc = 'Toggle git [b]lame' },
    { '<leader>gB', '<cmd>GitBlameCopySHA<cr>', desc = 'Copy [B]lame SHA' },
  },
}