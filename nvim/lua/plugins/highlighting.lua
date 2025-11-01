--    ▗▖ ▗▖▗▄▄▄▖ ▗▄▄▖▗▖ ▗▖▗▖   ▗▄▄▄▖ ▗▄▄▖▗▖ ▗▖▗▄▄▄▖▗▄▄▄▖▗▖  ▗▖ ▗▄▄▖
--    ▐▌ ▐▌  █  ▐▌   ▐▌ ▐▌▐▌     █  ▐▌   ▐▌ ▐▌  █    █  ▐▛▚▖▐▌▐▌
--    ▐▛▀▜▌  █  ▐▌▝▜▌▐▛▀▜▌▐▌     █  ▐▌▝▜▌▐▛▀▜▌  █    █  ▐▌ ▝▜▌▐▌▝▜▌
--    ▐▌ ▐▌▗▄█▄▖▝▚▄▞▘▐▌ ▐▌▐▙▄▄▖▗▄█▄▖▝▚▄▞▘▐▌ ▐▌  █  ▗▄█▄▖▐▌  ▐▌▝▚▄▞▘
--
--
--

return {

	--
	--    ▄▖▄▖▖ ▄▖▄▖▄▖▄▖▖▖▄▖▖  ▖▄▖
	--    ▌ ▌▌▌ ▌▌▙▘▚ ▌ ▙▌▙▖▛▖▞▌▙▖
	--    ▙▖▙▌▙▖▙▌▌▌▄▌▙▖▌▌▙▖▌▝ ▌▙▖
	--

	{ "bluz71/vim-moonfly-colors", name = "moonfly", lazy = false, priority = 1000 },

	-- {
	-- 	"ficcdaf/ashen.nvim",
	-- 	-- optional but recommended,
	-- 	-- pin to the latest stable release:
	-- 	tag = "*",
	-- 	lazy = false,
	-- 	priority = 1000,
	-- 	-- configuration is optional!
	-- 	opts = {
	-- 		-- your settings here
	-- 	},
	-- },


	--------------------------------------------------------------------------------------------------
	--
	--       ▘  ▘      ▜
	--    ▛▛▌▌▛▌▌  ▛▘▛▌▐ ▛▌▛▘▛▘
	--    ▌▌▌▌▌▌▌▗ ▙▖▙▌▐▖▙▌▌ ▄▌
	--		Color scheme editor
	--    https://github.com/nvim-mini/mini.nvim/blob/main/readmes/mini-colors.md
	{
		'nvim-mini/mini.colors',
		version = false,
	},

	--
	--        ▘  ▌         ▌  ▜ ▘   ▘▗
	--    ▛▘▀▌▌▛▌▛▌▛▌▌▌▌▄▖▛▌█▌▐ ▌▛▛▌▌▜▘█▌▛▘▛▘
	--    ▌ █▌▌▌▌▙▌▙▌▚▚▘  ▙▌▙▖▐▖▌▌▌▌▌▐▖▙▖▌ ▄▌
	--
	{
		'HiPhish/rainbow-delimiters.nvim',
		event = { "BufReadPost", "BufNewFile" },
		config = function()
			-- local rainbow_delimiters = require('rainbow-delimiters')
			vim.g.rainbow_delimiters = {
				strategy = {
					[''] = 'rainbow-delimiters.strategy.global',
					vim = 'rainbow-delimiters.strategy.local',
				},
				query = {
					[''] = 'rainbow-delimiters',
					lua = 'rainbow-blocks',
				},
				priority = {
					[''] = 110,
					lua = 210,
				},
				highlight = {
					'RainbowDelimiterRed',
					'RainbowDelimiterYellow',
					'RainbowDelimiterBlue',
					'RainbowDelimiterOrange',
					'RainbowDelimiterGreen',
					'RainbowDelimiterViolet',
					'RainbowDelimiterCyan',
				},
			}
		end
	},

	--        ▘     ▗         ▘▗ ▗
	--    ▛▌▌▌▌▛▛▌▄▖▜▘▛▘█▌█▌▛▘▌▜▘▜▘█▌▛▘
	--    ▌▌▚▘▌▌▌▌  ▐▖▌ ▙▖▙▖▄▌▌▐▖▐▖▙▖▌
	--
	{
		'nvim-treesitter/nvim-treesitter',
		opts = function(_, opts)
			table.insert(opts.ensure_installed, 'java')
		end,
	},


	-- {
	-- 	'nvim-treesitter/nvim-treesitter',
	-- 	branch = 'master',
	-- 	lazy   = false,
	-- 	build  = ':TSUpdate',
	-- 	event  = 'BufReadPre',
	-- 	config = function()
	-- 		require('nvim-treesitter.configs').setup({
	-- 			modules = {},
	-- 			ensure_installed = 'all',
	-- 			sync_install = false,
	-- 			auto_install = false,
	-- 			ignore_install = {},
	-- 			highlight = { enable = true },
	-- 			incremental_selection = {
	-- 				enable = true,
	-- 				keymaps = {
	-- 					init_selection = "gnn", -- set to `false` to disable one of the mappings
	-- 					node_incremental = "grn",
	-- 					scope_incremental = "grc",
	-- 					node_decremental = "grm",
	-- 				},
	-- 			},
	-- 			indent = {
	-- 				enable = true
	-- 			},
	-- 		})
	-- 	end,
	-- },


	--            ▗         ▜            ▌    ▗▘      ▝▖
	--    ▛▘▛▘█▌▀▌▜▘█▌  ▛▘▛▌▐ ▛▌▛▘  ▛▘▛▌▛▌█▌  ▐ ▛▘▛▘▛▘ ▌
	--    ▙▖▌ ▙▖█▌▐▖▙▖  ▙▖▙▌▐▖▙▌▌   ▙▖▙▌▙▌▙▖  ▐ ▙▖▙▖▙▖ ▌
	--                                        ▝▖      ▗▘
	{
		'uga-rosa/ccc.nvim',
		config = function()
			local ccc = require('ccc')
			local mapping = ccc.mapping

			ccc.setup({
				-- Your preferred settings
				-- Example: enable highlighter
				highlighter = {
					auto_enable = true,
					-- max_byte = 1000 * 1024,
					lsp = true,
				},
				pickers = {
					ccc.picker.ansi_escape(),
					ccc.picker.hex,
					ccc.picker.css_rgb,
					ccc.picker.css_hsl,
					ccc.picker.css_hwb,
					ccc.picker.css_lab,
					ccc.picker.css_lch,
					ccc.picker.css_oklab,
					ccc.picker.css_oklch,
				},

				lsp = true,
			})
		end,
	},

}
