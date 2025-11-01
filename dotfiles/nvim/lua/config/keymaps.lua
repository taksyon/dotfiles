-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

local keymap = vim.keymap.set
local opts = { noremap = true, silent = true }

-- vim.g.mapleader = ' '
-- vim.g.maplocalleader = ' '
--

--    ▜     ▘    ▌
--  ▛▌▐ ▌▌▛▌▌▛▌  ▙▘█▌▌▌▛▛▌▀▌▛▌▛▘
--  ▙▌▐▖▙▌▙▌▌▌▌  ▛▖▙▖▙▌▌▌▌█▌▙▌▄▌
--  ▌     ▄▌         ▄▌     ▌


-- Vertical split
keymap('n', '<leader>v', ':vsplit<CR>', opts)
keymap('n', '<leader>b', ':split<CR>', opts)
vim.api.nvim_set_keymap('', '<MiddleMouse>', '<Nop>', opts)
vim.api.nvim_set_keymap('i', '<MiddleMouse>', '<Nop>', opts)

-- Code actions
keymap("n", "<leader>ca", vim.lsp.buf.code_action, opts)

-- CCC (create color code)
keymap("n", "<leader>c", ':CccPick<CR>', opts)

-- Toggle file explorer
-- keymap('n', '<leader>n', '<cmd>lua Snacks.explorer.open({hidden = true})<cr>', opts) -- Toggle file explorer
keymap('n', '<leader>h', '<C-w>h', opts) -- switch to explorer

-- Open docs
keymap('n', 'K', function()
	require('hover').open()
end, { desc = 'hover.nvim (open)' })

-- Select docs
keymap('n', 'gK', function()
	require('hover').enter()
end, { desc = 'hover.nvim (enter)' })

-- Mouse support
-- keymap('n', '<MouseMove>', function()
-- 	require('hover').mouse()
-- end, { desc = 'hover.nvim (mouse)' })
--
-- vim.o.mousemoveevent = true
--



-- doc gen
keymap('n', '<leader>d', ":lua require('neogen').generate()<CR>", opts)

-- Telescope File Finder/Previewer
keymap('n', '<leader>T', function() require('telescope.builtin').treesitter() end, opts)
keymap('n', '<leader>t', '<cmd>Telescope find_files<cr>', opts)

-- Go to definition
-- keymap('n', 'gd', vim.lsp.buf.definition, opts)



-- Terminal
-- keymap('n', '<leader>z', '<cmd>lua Snacks.terminal.toggle()<cr>', opts)

-- Diagnostics
keymap('n', '<leader>i', function()
	vim.diagnostic.open_float(nil, { focus = false, border = 'rounded' })
end, opts)


--  ▌     ▘    ▌
--  ▛▌▀▌▛▘▌▛▘  ▙▘█▌▌▌▛▛▌▀▌▛▌▛▘
--  ▙▌█▌▄▌▌▙▖  ▛▖▙▖▙▌▌▌▌█▌▙▌▄▌
--                 ▄▌     ▌

-- Faster nav
keymap('n', '<leader>j', '5j', opts)
keymap('n', '<leader>k', '5k', opts)
keymap('n', '<leader>h', '5h', opts)
keymap('n', '<leader>l', '5l', opts)

keymap('n', 'H', '<C-w>w', opts)
keymap('n', 'L', '<C-w>l', opts)
-- Copy selected text to system clipboard
keymap('v', '<leader>y', '"+y', { desc = 'Copy to system clipboard' })
keymap('v', '<C-c>', '"+y', { desc = 'Copy to clipboard (Ctrl+Shift+C)' })

-- keymap('n', '<leader>y', '"+y', { desc = 'Copy line to system clipboard' })

-- Paste from system clipboard
keymap({ 'n', 'v' }, '<leader>p', '"+p', { desc = 'Paste from system clipboard' })
keymap({ 'n', 'v' }, '<C-v>', '"+p', { desc = 'Paste from system clipboard' })
keymap('n', '<leader>P', '"+P', { desc = 'Paste before from system clipboard' })


---------------------------- Editing
-- Delete character
keymap('n', 'x', 'x', opts)
-- Copy line
keymap('n', 'yy', 'yy', opts)
keymap('n', 'Y', '0v$y', opts) -- yank to end of line
-- Cut line
keymap('n', 'dd', 'dd', opts)
-- Paste after cursor
keymap('n', 'p', 'p', opts)
-- Paste before cursor
keymap('n', 'P', 'P', opts)
-- Undo
keymap('n', 'u', 'u', opts)
-- Redo
keymap('n', '<C-r>', '<C-r>', opts)
-- Move selected lines up/down in Visual mode
keymap('v', 'J', ":m '>+1<CR>gv=gv", opts)
keymap('v', 'K', ":m '<-2<CR>gv=gv", opts)
-- Add newline above/below without insert mode
keymap('n', '<leader>o', 'o<Esc>', opts)
keymap('n', '<leader>O', 'O<Esc>', opts)

---------------------------- Save & Quit
-- Save file
keymap('n', '<leader>w', ':w<CR>', opts)
-- Quit Neovim
keymap('n', '<leader>q', ':qa<CR>', opts)
-- Save & quit all
keymap('n', '<leader>x', ':w<CR>:qa<CR>', opts)
-- Reload config
keymap('n', '<leader>r', ':so $MYVIMRC<CR>', opts)

-------------------------------- Navigation
-- Move cursor by words
keymap('n', 'w', 'w', opts)   -- Next word
keymap('n', 'e', 'e', opts)   -- End of current/next word
keymap('n', 'q', 'b', opts)   -- Beginning of previous word
keymap('n', 'Q', 'q', opts)   -- Macro recording moved to Q
-- Move cursor by paragraphs
keymap('n', '{', '{', opts)   -- Previous paragraph
keymap('n', '}', '}', opts)   -- Next paragraph
-- Move cursor to start & end of line
keymap('n', '0', '0', opts)   -- Start of line
keymap('n', '^', '^', opts)   -- First non-whitespace character
keymap('n', '$', '$', opts)   -- End of line
-- Move cursor to start & end of file
keymap('n', 'gg', 'gg', opts) -- Start of file
keymap('n', 'G', 'G', opts)   -- End of file
-- Move between buffers
keymap('n', '<leader>bn', ':bnext<CR>', opts)
keymap('n', '<leader>bp', ':bprevious<CR>', opts)

-------------------------- Search & Replace
-- Search forward
keymap('n', '/', '/', opts)
-- Search backward
keymap('n', '?', '?', opts)
-- Search next match
keymap('n', 'n', 'nzzzv', opts)
-- Search previous match
keymap('n', 'N', 'Nzzzv', opts)
-- Search & replace (prompt)
keymap('n', '<leader>s', ':%s//g<Left><Left>', opts)
-- Search & replace word under cursor
keymap('n', '<leader>sw', ':%s/<C-r><C-w>//g<Left><Left>', opts)
-- Clear search highlighting
keymap('n', '<leader>.', ':nohlsearch<CR>', opts)

----------------------------------------------------------------------
-- function PyDocs()
-- 	local pydoc_types = {
-- 		"str", "int", "float", "complex", "list", "tuple", "range", "set", "frozenset",
-- 		"dict", "bytes", "bytearray", "memoryview", "bool", "iterator", "generator", "enumerate",
-- 		"zip", "super", "staticmethod", "classmethod", "reversed", "queue", "deque",
-- 		"NoneType", "object", "function", "math", "property", "map",
--
-- 		"EOFError", "ImportError", "IndexError", "KeyError", "MemoryError", "NameError",
-- 		"OSError", "RuntimeError", "StopIteration", "SyntaxError", "TypeError", "filter",
-- 		"ValueError", "ZeroDivisionError", "AttributeError", "Exception",
-- 		"defaultdict", "ellipsis", "slice", "ArithmeticError", "BaseException"
-- 	}
--
-- 	-- Get the word under the cursor
-- 	local current_word = vim.fn.expand("<cword>")
-- 	local cr = vim.fn.expand("<CR>")
-- 	local found = false -- Flag to check if documentation was found
-- 	local result = ""
--
-- 	for _, ptype in ipairs(pydoc_types) do
-- 		local command = string.format("pydoc %s.%s 2>/dev/null", ptype, current_word)
-- 		result = vim.fn.system(command)
--
-- 		if vim.v.shell_error == 0 then
-- 			found = true
-- 			print(result)
-- 			break -- Stop after finding the first valid documentation
-- 		end
-- 	end
--
-- 	if not found then
-- 		local command = ("Lspsaga hover_doc")
-- 		local popup = vim.cmd(command .. cr)
-- 		result = vim.fn.system("pydoc " .. current_word .. cr)
-- 		--result = "No documentation found for: " .. current_word
-- 		print(result)
-- 		print(popup)
-- 	end
-- end

--------------------------------------------------------------------------------
