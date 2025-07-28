-- project-utils: Utility commands for managing project.nvim history
-- Provides commands to edit and clear project history
-- Extends project.nvim with manual project management capabilities

return {
  'ahmedkhalf/project.nvim',
  dependencies = { 'nvim-telescope/telescope.nvim' },
  init = function()
    -- Command to edit project history
    vim.api.nvim_create_user_command('ProjectsEdit', function()
      local history_file = vim.fn.stdpath 'data' .. '/project_nvim/project_history'
      if vim.fn.filereadable(history_file) == 1 then
        vim.cmd('edit ' .. history_file)
        vim.notify('Delete lines for projects you want to remove, then save', vim.log.levels.INFO)
      else
        vim.notify('No project history found', vim.log.levels.WARN)
      end
    end, { desc = 'Edit project history' })

    -- Command to clear all projects
    vim.api.nvim_create_user_command('ProjectsClear', function()
      local history_file = vim.fn.stdpath 'data' .. '/project_nvim/project_history'
      if vim.fn.filereadable(history_file) == 1 then
        vim.fn.delete(history_file)
        vim.notify('All projects cleared!', vim.log.levels.INFO)
      else
        vim.notify('No project history to clear', vim.log.levels.WARN)
      end
    end, { desc = 'Clear all project history' })
  end,
}