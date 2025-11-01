-- ~/.config/nvim/lua/plugins/ui.lua
return {

	--          ▘  ▜       ▘
	--    ▀▌█▌▛▘▌▀▌▐   ▛▌▌▌▌▛▛▌
	--    █▌▙▖▌ ▌█▌▐▖▗ ▌▌▚▘▌▌▌▌
	--
	{
		'stevearc/aerial.nvim',
		opts = {},
		-- Optional dependencies
		dependencies = {
			"nvim-treesitter/nvim-treesitter",
			"nvim-tree/nvim-web-devicons"
		},
	},

	--            ▌         ▘
	--    ▛▘▛▌▀▌▛▘▙▘▛▘  ▛▌▌▌▌▛▛▌
	--    ▄▌▌▌█▌▙▖▛▖▄▌▗ ▌▌▚▘▌▌▌▌
	--
	{
		'folke/snacks.nvim',
		priority = 1000,
		lazy = false,
		opts = function()
			return require('plugins.ui.snacks.config')
		end,
	},

	--                  ▜ ▜
	--    ▛▌█▌▛▌▛▘▛▘▛▘▛▌▐ ▐
	--    ▌▌▙▖▙▌▄▌▙▖▌ ▙▌▐▖▐▖
	--
	{
		'karb94/neoscroll.nvim',
		opts = function()
			require('plugins.ui.neoscroll.config')
		end,
	},

	--       ▌          ▘
	--    █▌▛▌▛▌▌▌  ▛▌▌▌▌▛▛▌
	--    ▙▖▙▌▙▌▙▌▗ ▌▌▚▘▌▌▌▌
	--        ▄▌▄▌
	{
		'folke/edgy.nvim',
		opts = require('plugins.ui.edgy.config'),
	},

	--           ▌             ▌  ▌             ▘
	--    ▛▘█▌▛▌▛▌█▌▛▘▄▖▛▛▌▀▌▛▘▙▘▛▌▛▌▌▌▌▛▌  ▛▌▌▌▌▛▛▌
	--    ▌ ▙▖▌▌▙▌▙▖▌   ▌▌▌█▌▌ ▛▖▙▌▙▌▚▚▘▌▌▗ ▌▌▚▘▌▌▌▌
	--
	{
		'MeanderingProgrammer/render-markdown.nvim',
		dependencies = {
			'nvim-treesitter/nvim-treesitter',
			'nvim-tree/nvim-web-devicons',
		},                                              -- Ensure dependencies load properly
		event = { 'BufReadPre *.md', 'BufNewFile *.md' }, -- Lazy load when opening Markdown files
		config = require('plugins.ui.render-markdown.config'),
	},

	--    ▜     ▜ ▘          ▘
	--    ▐ ▌▌▀▌▐ ▌▛▌█▌  ▛▌▌▌▌▛▛▌
	--    ▐▖▙▌█▌▐▖▌▌▌▙▖▗ ▌▌▚▘▌▌▌▌
	--
	{
		'nvim-lualine/lualine.nvim',
		event = 'VeryLazy',
		dependencies = {
			'nvim-tree/nvim-web-devicons',
			'nvimtools/hydra.nvim',
		},
		config = require('plugins.ui.lualine.config'),
	},

	-- {
	--   "nvim-neo-tree/neo-tree.nvim",
	--   branch = "v3.x",
	--   dependencies = {
	--     "nvim-lua/plenary.nvim",
	--     "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
	--     "MunifTanjim/nui.nvim",
	--     -- {"3rd/image.nvim", opts = {}}, -- Optional image support in preview window: See `# Preview Mode` for more information
	--   },
	--   lazy = false, -- neo-tree will lazily load itself
	--   ---@module "neo-tree"
	--   ---@type neotree.Config?
	--   opts = {
	--     -- fill any relevant options here
	--   },
	-- },

	--        ▘          ▘
	--    ▛▌▛▌▌▛▘█▌  ▛▌▌▌▌▛▛▌
	--    ▌▌▙▌▌▙▖▙▖▗ ▌▌▚▘▌▌▌▌
	--
	{
		'folke/noice.nvim',
		event = 'VeryLazy',
		dependencies = {
			'MunifTanjim/nui.nvim', -- Required UI library
			'rcarriga/nvim-notify', -- Optional, enhances notifications
		},
		config = require('plugins.ui.noice.config'),
	},
}
