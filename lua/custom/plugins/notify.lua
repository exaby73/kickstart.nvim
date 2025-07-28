-- nvim-notify: Fancy, configurable notification manager for Neovim
-- Replaces vim.notify() with animated popup notifications
-- Configured for compact display with bottom-up slide animations

return {
  'rcarriga/nvim-notify',
  opts = {
    timeout = 1000,
    max_height = function()
      return math.floor(vim.o.lines * 0.15) -- Reduced from 75% to 15%
    end,
    max_width = function()
      return math.floor(vim.o.columns * 0.4) -- Reduced from 75% to 40%
    end,
    minimum_width = 20,
    top_down = false, -- Show notifications from bottom to top
    render = 'compact', -- Use compact rendering
    stages = 'slide', -- Slide in from the side
    on_open = function(win)
      vim.api.nvim_win_set_config(win, { zindex = 100 })
    end,
  },
  init = function()
    vim.notify = require 'notify'
  end,
}

