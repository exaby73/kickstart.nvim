return {
  'nvim-flutter/flutter-tools.nvim',
  lazy = false,
  dependencies = {
    'nvim-lua/plenary.nvim',
    'stevearc/dressing.nvim', -- optional for vim.ui.select
  },
  config = function()
    local telescope = require('telescope')
    
    -- This function extends the shared LSP keymaps with Flutter-specific ones
    local on_attach = function(client, bufnr)
      -- First, apply all the shared LSP keymaps
      require('custom.lsp-keymaps').on_attach(client, bufnr)
      
      -- Helper function to set keymaps (for Flutter-specific ones)
      local function map(keys, func, desc, mode)
        mode = mode or 'n'
        vim.keymap.set(mode, keys, func, { buffer = bufnr, desc = 'Flutter: ' .. desc })
      end
      
      -- Flutter specific keymaps
      map('<leader>Fr', '<cmd>FlutterRun<cr>', '[R]un')
      map('<leader>Fq', '<cmd>FlutterQuit<cr>', '[Q]uit')
      map('<leader>FR', '<cmd>FlutterReload<cr>', '[R]eload')
      map('<leader>FS', '<cmd>FlutterRestart<cr>', 'Re[S]tart')
      map('<leader>FD', '<cmd>FlutterDevices<cr>', '[D]evices')
      map('<leader>Fe', '<cmd>FlutterEmulators<cr>', '[E]mulators')
      map('<leader>Fo', '<cmd>FlutterOutlineOpen<cr>', '[O]utline Open')
      map('<leader>Fc', '<cmd>FlutterOutlineToggle<cr>', 'Outline Toggle ([C]lose)')
      map('<leader>Fd', '<cmd>FlutterDevTools<cr>', '[D]ev Tools')
      map('<leader>FO', '<cmd>FlutterOpenDevTools<cr>', '[O]pen Dev Tools')
      map('<leader>Fp', '<cmd>FlutterCopyProfilerUrl<cr>', 'Copy [P]rofiler URL')
      map('<leader>Fl', '<cmd>FlutterLspRestart<cr>', '[L]SP Restart')
      
      -- Use Telescope for Flutter commands
      if telescope then
        telescope.load_extension('flutter')
        map('<leader>Ff', '<cmd>Telescope flutter commands<cr>', 'Commands (Telescope)')
      end
    end

    require('flutter-tools').setup({
      ui = {
        border = 'rounded',
        notification_style = 'native',
      },
      decorations = {
        statusline = {
          app_version = true,
          device = true,
          project_config = true,
        },
      },
      debugger = {
        enabled = true,
        run_via_dap = true,
        exception_breakpoints = {},
      },
      flutter_path = nil, -- uses system PATH
      flutter_lookup_cmd = 'asdf where flutter', -- Get Flutter SDK directory from asdf
      root_patterns = { '.git', 'pubspec.yaml' },
      fvm = false,
      widget_guides = {
        enabled = true,
      },
      closing_tags = {
        highlight = 'Comment',
        prefix = '// ',
        enabled = true,
      },
      dev_log = {
        enabled = true,
        notify_errors = false,
        open_cmd = 'tabedit',
      },
      dev_tools = {
        autostart = false,
        auto_open_browser = true,
      },
      outline = {
        open_cmd = '30vnew',
        auto_open = false,
      },
      lsp = {
        color = {
          enabled = true,
          background = false,
          background_color = nil,
          foreground = false,
          virtual_text = true,
          virtual_text_str = '■',
        },
        on_attach = on_attach,
        capabilities = function()
          -- Get capabilities from blink.cmp if available
          local has_blink, blink = pcall(require, 'blink.cmp')
          if has_blink then
            return blink.get_lsp_capabilities()
          else
            return vim.lsp.protocol.make_client_capabilities()
          end
        end,
        settings = {
          showTodos = true,
          completeFunctionCalls = true,
          analysisExcludedFolders = {
            vim.fn.expand('$HOME/.pub-cache'),
            vim.fn.expand('$HOME/fvm'),
          },
          renameFilesWithClasses = 'prompt',
          enableSnippets = true,
          updateImportsOnRename = true,
        },
      },
    })
  end,
}