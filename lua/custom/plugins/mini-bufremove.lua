-- mini.bufremove: Minimal buffer removal with layout preservation
-- Provides smarter buffer deletion that maintains window layout
-- Handles edge cases like last buffer and modified buffers gracefully

return {
  'echasnovski/mini.bufremove',
  version = '*',
  config = true,
}