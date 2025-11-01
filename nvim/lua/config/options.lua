vim.o.number = true
vim.o.cursorline = true
vim.o.cursorcolumn = true
vim.o.relativenumber = false
vim.o.termguicolors = true
vim.o.tabstop = 2
vim.o.softtabstop = 2
vim.o.shiftwidth = 2     -- Set indentation width
vim.o.expandtab = true   -- Use spaces instead of tabs
vim.o.smartindent = true -- Smart auto-indenting
vim.o.wrap = false       -- Disable line wrapping
vim.o.mouse = 'a'        -- Enable mouse support
vim.o.mousescroll = 'ver:2,hor:3'
vim.o.smoothscroll = true
vim.o.background = 'dark'
vim.o.signcolumn = 'number'
vim.o.confirm = true
vim.o.pumblend = 20
-- vim.o.winborder = 'rounded'
vim.o.scrolloff = 2
vim.o.sidescrolloff = 5
vim.o.spell = false
vim.o.splitright = true
vim.o.statuscolumn = '%@SignCb@%s%=%T%@NumCb@%l│%T'
vim.o.virtualedit = 'all'
vim.o.winbar = ""


-- vim.opt.foldmethod = "indent"

vim.o.guicursor = table.concat({
  'n-v-c:block-Cursor/lCursor',
  'i-ci:ver25-Cursor/lCursor-blinkwait1000-blinkon100-blinkoff100',
  'r:hor50-Cursor/lCursor-blinkwait100-blinkon100-blinkoff100'
}, ',')
vim.o.whichwrap = 'b,s,<,>,[,]'

vim.diagnostic.config({
  virtual_text = false,
  -- diagnostic_only_current = true
})

-- vim.lsp.set_log_level('debug')
