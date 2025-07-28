# Neovim Configuration

A modular Neovim configuration based on Kickstart.nvim with custom enhancements.

## Features

* Clean, modular structure
* LSP support with auto-completion
* Fuzzy finding with Telescope
* Syntax highlighting with Treesitter
* Git integration with Gitsigns
* File explorer with Neo-tree
* Flutter development support
* Custom snippets with LuaSnip

## Structure

```console
nvim/
├── init.lua                    # Main entry point
├── lua/
│   ├── options.lua            # Neovim options
│   ├── core/
│   │   ├── keymaps.lua        # Key mappings
│   │   ├── autocommands.lua   # Auto commands
│   │   └── lazy_bootstrap.lua # Plugin manager bootstrap
│   ├── kickstart/
│   │   └── plugins/           # Core plugins
│   │       ├── autopairs.lua
│   │       ├── completion.lua
│   │       ├── formatting.lua
│   │       ├── git.lua
│   │       ├── lsp.lua
│   │       ├── mini.lua
│   │       ├── misc.lua
│   │       ├── neo-tree.lua
│   │       ├── telescope.lua
│   │       ├── treesitter.lua
│   │       └── ui.lua
│   └── custom/
│       ├── lsp-keymaps.lua    # LSP key mappings
│       ├── snippets/          # Custom snippets
│       └── plugins/           # Custom plugins
│           ├── buffer-switcher.lua
│           ├── cybu.lua
│           ├── flutter-tools.lua
│           ├── luasnip.lua
│           ├── mru-buffers.lua
│           └── surround.lua
```

## Installation

### Prerequisites

* Neovim >= 0.9.0
* Git
* A [Nerd Font](https://www.nerdfonts.com/) (optional, but recommended)
* Language servers for your languages (installed automatically via Mason)

### Quick Start

1. Backup your existing configuration:

   ```bash
   mv ~/.config/nvim ~/.config/nvim.bak
   ```

2. Clone this configuration:

   ```bash
   git clone https://github.com/yourusername/nvim.git ~/.config/nvim
   ```

3. Start Neovim:

   ```bash
   nvim
   ```

4. Wait for plugins to install automatically

## Key Mappings

### General

* `<Space>` - Leader key
* `<Esc>` - Clear search highlights
* `<C-h/j/k/l>` - Navigate between windows

### Buffers

* `<leader>x` - Delete current buffer
* `<leader>X` - Delete all buffers except current
* `<leader><leader>` - Find buffers (Telescope)
* `]b` / `[b` - Next/Previous MRU buffer
* `<Alt-Tab>` - Cycle buffers with visual feedback (Cybu)

### Tabs

* `<leader>Tn` - New tab
* `<leader>Tc` - Close tab
* `<leader>To` - Close other tabs
* `<leader>Ts` - Convert tab to split
* `<Tab>` / `<S-Tab>` - Next/Previous tab

### Search (Telescope)

* `<leader>sf` - Find files
* `<leader>sg` - Live grep
* `<leader>sh` - Search help
* `<leader>sk` - Search keymaps
* `<leader>ss` - Search Telescope builtins
* `<leader>sw` - Search current word
* `<leader>sd` - Search diagnostics
* `<leader>sr` - Resume last search
* `<leader>s.` - Recent files
* `<leader>sn` - Search Neovim config files
* `<leader>/` - Fuzzy search current buffer

### LSP

* `gd` - Go to definition
* `gr` - Go to references
* `gI` - Go to implementation
* `<leader>D` - Go to type definition
* `<leader>ds` - Document symbols
* `<leader>ws` - Workspace symbols
* `<leader>rn` - Rename
* `<leader>ca` - Code action
* `gD` - Go to declaration
* `K` - Hover documentation
* `<C-k>` - Signature help

### File Explorer

* `\` - Toggle Neo-tree

### Formatting

* `<leader>f` - Format buffer

### Diagnostics

* `<leader>q` - Open diagnostic quickfix list
* `[d` / `]d` - Go to previous/next diagnostic
* `<leader>e` - Show diagnostic float
* `<leader>q` - Set diagnostic to location list

### Git (Gitsigns)

* `<leader>hp` - Preview hunk
* `<leader>hs` - Stage hunk
* `<leader>hr` - Reset hunk
* `<leader>hS` - Stage buffer
* `<leader>hu` - Undo stage hunk
* `<leader>hR` - Reset buffer
* `<leader>hb` - Blame line
* `<leader>hd` - Diff this
* `<leader>hD` - Diff this ~
* `]c` / `[c` - Next/Previous hunk

### Flutter

* `<leader>Fc` - Run Flutter command
* `<leader>Fd` - Open Flutter devices
* `<leader>Fe` - Open Flutter emulators
* `<leader>Fr` - Flutter reload
* `<leader>FR` - Flutter restart
* `<leader>Fq` - Flutter quit
* `<leader>FD` - Flutter detach
* `<leader>Fo` - Flutter outline
* `<leader>Fv` - Flutter dev tools

## Customization

### Adding Plugins

Create a new file in `lua/custom/plugins/` with your plugin configuration:

```lua
return {
  {
    'plugin/name',
    config = function()
      -- Plugin configuration
    end,
  },
}
```

### Adding LSP Servers

Edit `lua/kickstart/plugins/lsp.lua` and add your server to the `servers` table:

```lua
local servers = {
  lua_ls = { ... },
  -- Add your server here
  pyright = {},
  tsserver = {},
}
```

### Custom Snippets

Add snippets in `lua/custom/snippets/` directory. See `dart.lua` for an example.

## Troubleshooting

* Run `:checkhealth` to diagnose issues
* Run `:Lazy` to manage plugins
* Run `:Mason` to manage LSP servers and tools
* Check logs with `:lua vim.print(vim.lsp.get_log_path())`

## Credits

Based on [kickstart.nvim](https://github.com/nvim-lua/kickstart.nvim) by TJ DeVries.
