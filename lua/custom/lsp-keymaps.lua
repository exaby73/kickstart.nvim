-- Shared LSP keymaps configuration
local M = {}

-- This function sets up all LSP keymaps for a given buffer
-- @param client The LSP client
-- @param bufnr The buffer number
function M.on_attach(client, bufnr)
  -- Helper function to set keymaps
  local function map(keys, func, desc, mode)
    mode = mode or 'n'
    vim.keymap.set(mode, keys, func, { buffer = bufnr, desc = 'LSP: ' .. desc })
  end

  -- Essential LSP keymaps
  map('K', vim.lsp.buf.hover, 'Hover Documentation')
  map('gd', require('telescope.builtin').lsp_definitions, '[G]oto [D]efinition')
  map('gD', vim.lsp.buf.declaration, '[G]oto [D]eclaration')
  map('gri', require('telescope.builtin').lsp_implementations, '[G]oto [I]mplementation')
  map('grr', require('telescope.builtin').lsp_references, '[G]oto [R]eferences')
  map('grt', require('telescope.builtin').lsp_type_definitions, '[G]oto [T]ype Definition')

  -- Code actions
  map('<leader>ca', vim.lsp.buf.code_action, '[C]ode [A]ction', { 'n', 'x' })
  map('<leader>cr', vim.lsp.buf.rename, '[C]ode [R]ename')

  -- Workspace and document symbols
  map('<leader>cs', require('telescope.builtin').lsp_document_symbols, '[C]ode [S]ymbols (Document)')
  map('<leader>cS', require('telescope.builtin').lsp_dynamic_workspace_symbols, '[C]ode [S]ymbols (Workspace)')

  -- Additional mappings that were only in init.lua
  map('grd', require('telescope.builtin').lsp_definitions, '[G]oto [D]efinition')
  map('grD', vim.lsp.buf.declaration, '[G]oto [D]eclaration')

  -- Signature help
  map('gs', vim.lsp.buf.signature_help, 'Signature Documentation')
  map('<C-k>', vim.lsp.buf.signature_help, 'Signature Documentation', 'i')

  -- Diagnostic keymaps
  map('[d', function()
    vim.diagnostic.jump { count = -1 }
  end, 'Go to previous diagnostic')
  map(']d', function()
    vim.diagnostic.jump { count = 1 }
  end, 'Go to next diagnostic')
  map('<leader>e', vim.diagnostic.open_float, 'Open floating diagnostic')

  -- This function resolves a difference between neovim nightly (version 0.11) and stable (version 0.10)
  local function client_supports_method(lsp_client, method, buf)
    if vim.fn.has 'nvim-0.11' == 1 then
      return lsp_client:supports_method(method, buf)
    else
      return lsp_client.supports_method(method, { bufnr = buf })
    end
  end

  -- Highlight references on cursor hold
  if client and client_supports_method(client, vim.lsp.protocol.Methods.textDocument_documentHighlight, bufnr) then
    local highlight_augroup = vim.api.nvim_create_augroup('kickstart-lsp-highlight', { clear = false })
    vim.api.nvim_create_autocmd({ 'CursorHold', 'CursorHoldI' }, {
      buffer = bufnr,
      group = highlight_augroup,
      callback = vim.lsp.buf.document_highlight,
    })

    vim.api.nvim_create_autocmd({ 'CursorMoved', 'CursorMovedI' }, {
      buffer = bufnr,
      group = highlight_augroup,
      callback = vim.lsp.buf.clear_references,
    })

    vim.api.nvim_create_autocmd('LspDetach', {
      group = vim.api.nvim_create_augroup('kickstart-lsp-detach', { clear = true }),
      callback = function(event)
        vim.lsp.buf.clear_references()
        vim.api.nvim_clear_autocmds { group = 'kickstart-lsp-highlight', buffer = event.buf }
      end,
    })
  end

  -- Enable inlay hints if supported
  if client and client_supports_method(client, vim.lsp.protocol.Methods.textDocument_inlayHint, bufnr) then
    map('<leader>th', function()
      vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled { bufnr = bufnr })
    end, '[T]oggle Inlay [H]ints')
  end
end

return M
