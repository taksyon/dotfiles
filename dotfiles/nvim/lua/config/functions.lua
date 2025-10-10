-- ~/.config/nvim/lua/config/functions.lua
-- luadev: global vim

-- Function to open a custom markdown file in a floating window
local M = {}

M.open_markdown_in_float = function()
  -- Create a new buffer
  local buf = vim.api.nvim_create_buf(false, true) -- false = no file, true = scratch buffer

  -- Open a floating window
  local win = vim.api.nvim_open_win(buf, true, {
    relative = 'editor', -- relative to the editor
    width = 80,          -- width of the window
    height = 20,         -- height of the window
    col = 10,            -- column position
    row = 10,            -- row position
    style = 'minimal',   -- minimal window style
  })

  -- Set the filetype to markdown
  vim.api.nvim_buf_set_option(buf, 'filetype', 'markdown')

  -- Read your custom markdown file into the buffer
  local lines = vim.fn.readfile("path/to/your/markdown.md")
  vim.api.nvim_buf_set_lines(buf, 0, -1, false, lines)
end

return M
