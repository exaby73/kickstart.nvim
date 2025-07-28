local map = vim.keymap.set

-- Clear search highlights
map('n', '<Esc>', '<cmd>nohlsearch<CR>')

-- Buffer management
map('n', '<leader>x', function()
  local current_buf = vim.api.nvim_get_current_buf()

  -- Use mini.bufremove if available (same as bufferline uses)
  local ok, mini_bufremove = pcall(require, 'mini.bufremove')
  if ok then
    mini_bufremove.delete(current_buf, false)
    return
  end

  -- Fallback to simple bd command
  vim.cmd 'bd'
end, { desc = 'Delete current buffer' })

map('n', '<leader>X', '<cmd>%bd|e#|bd#<CR>', { desc = 'Delete all buffers except current' })

-- Tab management
map('n', '<leader>Tn', '<cmd>tabnew<CR>', { desc = '[T]ab [N]ew' })
map('n', '<leader>Tc', '<cmd>tabclose<CR>', { desc = '[T]ab [C]lose' })
map('n', '<leader>To', '<cmd>tabonly<CR>', { desc = '[T]ab [O]nly (close others)' })
map('n', '<Tab>', '<cmd>tabnext<CR>', { desc = 'Next tab' })
map('n', '<S-Tab>', '<cmd>tabprevious<CR>', { desc = 'Previous tab' })

-- Tab to split conversion
map('n', '<leader>Ts', function()
  local current_tab = vim.fn.tabpagenr()
  if current_tab == 1 then
    vim.notify('No previous tab to merge into', vim.log.levels.WARN)
    return
  end

  local buf = vim.api.nvim_get_current_buf()
  vim.cmd 'tabprevious'
  vim.cmd 'botright split'
  vim.cmd('resize ' .. math.floor(vim.o.lines * 0.35))
  vim.api.nvim_set_current_buf(buf)
  vim.cmd('execute "tabclose ' .. current_tab .. '"')
end, { desc = '[T]ab to [S]plit (bottom 35%)' })

-- Diagnostics
map('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostic [Q]uickfix list' })

-- Terminal
map('t', '<Esc><Esc>', '<C-\\><C-n>', { desc = 'Exit terminal mode' })

-- Window navigation
map('n', '<C-h>', '<C-w><C-h>', { desc = 'Move focus to the left window' })
map('n', '<C-l>', '<C-w><C-l>', { desc = 'Move focus to the right window' })
map('n', '<C-j>', '<C-w><C-j>', { desc = 'Move focus to the lower window' })
map('n', '<C-k>', '<C-w><C-k>', { desc = 'Move focus to the upper window' })

