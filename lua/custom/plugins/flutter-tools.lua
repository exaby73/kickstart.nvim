return {
  'nvim-flutter/flutter-tools.nvim',
  lazy = false,
  dependencies = {
    'nvim-lua/plenary.nvim',
    'stevearc/dressing.nvim', -- optional for vim.ui.select
  },
  config = function()
    local telescope = require('telescope')
    
    -- This function defines all the LSP keymaps
    local on_attach = function(client, bufnr)
      -- Helper function to set keymaps
      local function map(keys, func, desc, mode)
        mode = mode or 'n'
        vim.keymap.set(mode, keys, func, { buffer = bufnr, desc = 'LSP: ' .. desc })
      end

      -- Essential LSP keymaps (matching those in init.lua)
      map('K', vim.lsp.buf.hover, 'Hover Documentation')
      map('gd', require('telescope.builtin').lsp_definitions, '[G]oto [D]efinition')
      map('gD', vim.lsp.buf.declaration, '[G]oto [D]eclaration')
      map('gi', require('telescope.builtin').lsp_implementations, '[G]oto [I]mplementation')
      map('go', require('telescope.builtin').lsp_type_definitions, 'Type [D]efinition')
      map('gr', require('telescope.builtin').lsp_references, '[G]oto [R]eferences')
      map('gs', vim.lsp.buf.signature_help, 'Signature Documentation')
      map('<C-k>', vim.lsp.buf.signature_help, 'Signature Documentation', 'i')
      
      -- Rename and code actions
      map('grn', vim.lsp.buf.rename, '[R]e[n]ame')
      map('gra', vim.lsp.buf.code_action, '[G]oto Code [A]ction', { 'n', 'x' })
      
      -- Workspace symbols
      map('gO', require('telescope.builtin').lsp_document_symbols, 'Open Document Symbols')
      map('gW', require('telescope.builtin').lsp_dynamic_workspace_symbols, 'Open Workspace Symbols')
      
      -- Type definitions
      map('grt', require('telescope.builtin').lsp_type_definitions, '[G]oto [T]ype Definition')
      
      -- Additional helpful mappings
      map('<leader>D', vim.lsp.buf.type_definition, 'Type [D]efinition')
      map('<leader>ds', require('telescope.builtin').lsp_document_symbols, '[D]ocument [S]ymbols')
      map('<leader>ws', require('telescope.builtin').lsp_dynamic_workspace_symbols, '[W]orkspace [S]ymbols')
      
      -- Diagnostic keymaps (buffer specific)
      map('[d', vim.diagnostic.goto_prev, 'Go to previous diagnostic message')
      map(']d', vim.diagnostic.goto_next, 'Go to next diagnostic message')
      map('<leader>e', vim.diagnostic.open_float, 'Open floating diagnostic message')
      
      -- Flutter specific keymaps
      map('<leader>Fr', '<cmd>FlutterRun<cr>', '[F]lutter [R]un')
      map('<leader>Fq', '<cmd>FlutterQuit<cr>', '[F]lutter [Q]uit')
      map('<leader>FR', '<cmd>FlutterReload<cr>', '[F]lutter [R]eload')
      map('<leader>FS', '<cmd>FlutterRestart<cr>', '[F]lutter Re[S]tart')
      map('<leader>FD', '<cmd>FlutterDevices<cr>', '[F]lutter [D]evices')
      map('<leader>Fe', '<cmd>FlutterEmulators<cr>', '[F]lutter [E]mulators')
      map('<leader>Fo', '<cmd>FlutterOutlineOpen<cr>', '[F]lutter [O]utline Open')
      map('<leader>Fc', '<cmd>FlutterOutlineToggle<cr>', '[F]lutter Outline Toggle ([C]lose)')
      map('<leader>Fd', '<cmd>FlutterDevTools<cr>', '[F]lutter [D]ev Tools')
      map('<leader>Fp', '<cmd>FlutterCopyProfilerUrl<cr>', '[F]lutter Copy [P]rofiler URL')
      map('<leader>Fl', '<cmd>FlutterLspRestart<cr>', '[F]lutter [L]SP Restart')
      
      -- Use Telescope for Flutter commands
      if telescope then
        telescope.load_extension('flutter')
        map('<leader>Ff', '<cmd>Telescope flutter commands<cr>', '[F]lutter Commands')
      end
      
      -- Enable inlay hints if supported
      if client.server_capabilities.inlayHintProvider then
        vim.lsp.inlay_hint.enable(true, { bufnr = bufnr })
        map('<leader>th', function()
          vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled({ bufnr = bufnr }), { bufnr = bufnr })
        end, '[T]oggle Inlay [H]ints')
      end
      
      -- Highlight references on cursor hold
      if client.server_capabilities.documentHighlightProvider then
        vim.api.nvim_create_autocmd({ 'CursorHold', 'CursorHoldI' }, {
          buffer = bufnr,
          callback = vim.lsp.buf.document_highlight,
        })
        vim.api.nvim_create_autocmd({ 'CursorMoved', 'CursorMovedI' }, {
          buffer = bufnr,
          callback = vim.lsp.buf.clear_references,
        })
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