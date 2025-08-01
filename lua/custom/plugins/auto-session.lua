-- auto-session: Automatic session management for Neovim
-- Saves and restores your session (open files, cursor positions, etc.) automatically
-- Supports per-git-branch sessions for easy context switching

return {
  'rmagatti/auto-session',
  lazy = false,
  opts = {
    auto_session_suppress_dirs = { '~/', '~/Projects', '~/Downloads', '/' },
    auto_session_use_git_branch = true,
    auto_save_enabled = true,
    auto_restore_enabled = true,
  },
  keys = {
    { '<leader>Sd', '<cmd>SessionDelete<cr>', desc = 'Delete current session' },
    { '<leader>SD', '<cmd>SessionPurgeOrphaned<cr>', desc = 'Delete orphaned sessions' },
    { '<leader>Ss', '<cmd>SessionSearch<cr>', desc = 'Search sessions' },
  },
}
