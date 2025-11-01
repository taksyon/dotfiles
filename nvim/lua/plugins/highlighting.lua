return {
	-- Color Scheme
	--
	-- {
	-- 	'projekt0n/github-nvim-theme',
	-- 	name = 'github-theme',
	-- 	lazy = false,  -- make sure we load this during startup if it is your main colorscheme
	-- 	priority = 1000, -- make sure to load this before all the other start plugins
	-- 	config = function()
	-- 		-- require('github-theme').setup({
	-- 		-- ...
	-- 		-- })


	{ "bluz71/vim-moonfly-colors", name = "moonfly", lazy = false, priority = 1000 },
	-- Syntax Highlighting
	{
		'nvim-treesitter/nvim-treesitter',
		build  = ':TSUpdate',
		event  = 'BufReadPre',
		config = function()
			require('nvim-treesitter.configs').setup({
				modules = {},
				ensure_installed = 'all',
				sync_install = false,
				auto_install = false,
				ignore_install = {},
				highlight = { enable = true },
				incremental_selection = {
					enable = true,
					keymaps = {
						init_selection = "gnn", -- set to `false` to disable one of the mappings
						node_incremental = "grn",
						scope_incremental = "grc",
						node_decremental = "grm",
					},
				},
				indent = {
					enable = true
				},
			})
		end,
	},

	-- Colorizer (hex codes appear as their color)
	{
		'norcalli/nvim-colorizer.lua',
		config = function()
			require('colorizer').setup({
				'*',                 -- Highlight all files, customize as needed
				css = { rgb_fn = true }, -- Enable `rgb()` and `rgba()` function highlighting
			})
		end,
	},
}
