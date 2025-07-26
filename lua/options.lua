-- Global variables
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '
vim.g.have_nerd_font = false

-- Line numbers
vim.o.number = true
-- vim.o.relativenumber = true

-- Mouse support
vim.o.mouse = 'a'

-- Mode display
vim.o.showmode = false

-- Indentation
vim.o.breakindent = true

-- Tab settings (default 4 spaces)
vim.o.tabstop = 4
vim.o.shiftwidth = 4
vim.o.expandtab = true

-- Undo
vim.o.undofile = true

-- Search
vim.o.ignorecase = true
vim.o.smartcase = true

-- Sign column
vim.o.signcolumn = 'yes'

-- Timing
vim.o.updatetime = 250
vim.o.timeoutlen = 300

-- Split behavior
vim.o.splitright = true
vim.o.splitbelow = true

-- Whitespace display
vim.o.list = true
vim.opt.listchars = { tab = '» ', trail = '·', nbsp = '␣' }

-- Live substitution preview
vim.o.inccommand = 'split'

-- Cursor line
vim.o.cursorline = true

-- Scrolling
vim.o.scrolloff = 10

-- Confirm operations
vim.o.confirm = true

-- Autocommand for Dart files (tab width 2)
vim.api.nvim_create_autocmd('FileType', {
  pattern = 'dart',
  callback = function()
    vim.bo.tabstop = 2
    vim.bo.shiftwidth = 2
  end,
  desc = 'Set tab width to 2 for Dart files',
})

-- Auto-save on focus change
vim.api.nvim_create_autocmd({ 'FocusLost', 'WinLeave', 'BufLeave' }, {
  pattern = '*',
  callback = function()
    if vim.bo.modified and not vim.bo.readonly and vim.fn.expand '%' ~= '' and vim.bo.buftype == '' then
      vim.api.nvim_command 'silent! write'
    end
  end,
  desc = 'Auto-save buffer on focus change',
})
