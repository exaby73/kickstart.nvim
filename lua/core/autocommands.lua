local autocmd = vim.api.nvim_create_autocmd
local augroup = vim.api.nvim_create_augroup

-- Highlight on yank
autocmd('TextYankPost', {
  desc = 'Highlight when yanking text',
  group = augroup('highlight-yank', { clear = true }),
  callback = function()
    vim.hl.on_yank()
  end,
})

-- Auto-reload files when changed externally
autocmd({ 'FocusGained', 'BufEnter', 'CursorHold', 'CursorHoldI' }, {
  desc = 'Check if file was changed externally',
  group = augroup('auto-reload-file', { clear = true }),
  pattern = '*',
  callback = function()
    if vim.fn.getcmdwintype() ~= '' then
      return
    end
    vim.cmd 'checktime'
  end,
})

-- Notification when file changes
autocmd('FileChangedShellPost', {
  desc = 'Notify when file is changed externally',
  group = augroup('notify-file-change', { clear = true }),
  pattern = '*',
  callback = function()
    vim.notify('File changed on disk. Buffer reloaded!', vim.log.levels.INFO, { title = 'File Reloaded' })
  end,
})

-- Also check on these additional events
autocmd({ 'TermClose', 'TermLeave' }, {
  desc = 'Check for file changes after terminal use',
  group = augroup('auto-reload-terminal', { clear = true }),
  pattern = '*',
  callback = function()
    vim.cmd 'checktime'
  end,
})

-- Watch for file changes using timer (more aggressive)
local timer = vim.loop.new_timer()
if timer then
  timer:start(1000, 1000, vim.schedule_wrap(function()
    if vim.fn.getcmdwintype() == '' then
      vim.cmd 'silent! checktime'
    end
  end))
end