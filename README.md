# Neovim Configuration

A modular Neovim configuration based on Kickstart.nvim with custom enhancements.

## Features

* Clean, modular structure
* LSP support with auto-completion
* Fuzzy finding and searching
* Advanced syntax highlighting
* Git integration
* File explorer
* Flutter development support
* Custom snippets support

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
│   │   └── plugins/           # Core plugins from kickstart
│   └── custom/
│       ├── lsp-keymaps.lua    # LSP key mappings
│       ├── snippets/          # Custom snippets
│       └── plugins/           # Your custom plugins
```

## Installation

### Prerequisites

* Neovim >= 0.9.0
* Git
* A [Nerd Font](https://www.nerdfonts.com/) (optional, but recommended)
* Language servers for your languages (installed automatically)

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

## Essential Key Mappings

* **Leader key**: `<Space>`
* **Navigate windows**: `<C-h/j/k/l>`

### Finding Things

* `<leader>sf` - Find files
* `<leader>sg` - Search by grep
* `<leader>sk` - Search keymaps (see all mappings)
* `<leader><leader>` - Find open buffers
* `<leader>/` - Search in current file

### Code Navigation

* `gd` - Go to definition
* `K` - Show documentation
* `<leader>ca` - Code actions
* `<leader>cr` - Rename symbol

### Other

* `\` - Toggle file explorer
* `<leader>f` - Format buffer

> **Tip**: Use `<leader>sk` to discover all available key mappings!

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

Add snippets in `lua/custom/snippets/` directory.

## Troubleshooting

* Run `:checkhealth` to diagnose issues
* Run `:Lazy` to manage plugins
* Run `:Mason` to manage LSP servers and tools
* Check logs with `:lua vim.print(vim.lsp.get_log_path())`

## Credits

Based on [kickstart.nvim](https://github.com/nvim-lua/kickstart.nvim) by TJ DeVries.
