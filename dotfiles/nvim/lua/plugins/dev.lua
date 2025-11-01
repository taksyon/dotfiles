--    ▗▄▄▄ ▗▄▄▄▖▗▖  ▗▖
--    ▐▌  █▐▌   ▐▌  ▐▌
--    ▐▌  █▐▛▀▀▘▐▌  ▐▌
--    ▐▙▄▄▀▐▙▄▄▖ ▝▚▞▘
--
--
--

return {
	{
		'L3MON4D3/LuaSnip',
		version = 'v2.*',              -- optional: use stable version
		build = 'make install_jsregexp', -- for regex snippet support
		dependencies = {
			'rafamadriz/friendly-snippets', -- optional: prebuilt snippets
		},
		config = function()
			require('luasnip.loaders.from_vscode').lazy_load()
		end,
	},
	-- {
	-- 	'saadparwaiz1/cmp_luasnip',
	-- },

	{
		'folke/lazydev.nvim',
		ft = 'lua', -- only load on lua files
		opts = {
			library = {
				-- See the configuration section for more details
				-- Load luvit types when the `vim.uv` word is found
				{ path = '${3rd}/luv/library', words = { 'vim%.uv' } },
			},
		},
	},

	-- add cmp-emoji
	{
		"hrsh7th/nvim-cmp",
		dependencies = { "hrsh7th/cmp-emoji" },
		opts = function(_, opts)
			table.insert(opts.sources, { name = "emoji" })
		end,
	},
	-- nvim-cmp setup
	-- lua/plugins/cmp.lua
	-- {
	-- 	"hrsh7th/nvim-cmp",
	-- 	event = "InsertEnter", -- load cmp when you actually need it
	-- 	dependencies = {
	-- 		"L3MON4D3/LuaSnip",
	-- 		"saadparwaiz1/cmp_luasnip",
	-- 		"hrsh7th/cmp-nvim-lsp",
	-- 		"hrsh7th/cmp-buffer",
	-- 		"hrsh7th/cmp-path",
	-- 	},
	-- 	config = function()
	-- 		local cmp = require("cmp")
	-- 		local luasnip = require("luasnip")
	--
	-- 		require("luasnip.loaders.from_vscode").lazy_load() -- optional if you use vscode snippets
	--
	-- 		cmp.setup({
	-- 			snippet = {
	-- 				expand = function(args) luasnip.lsp_expand(args.body) end,
	-- 			},
	-- 			mapping = cmp.mapping.preset.insert({
	-- 				["<C-Space>"] = cmp.mapping.complete(),
	-- 				["<CR>"]      = cmp.mapping.confirm({ select = true }),
	-- 				["<Tab>"]     = function(fallback)
	-- 					if cmp.visible() then
	-- 						cmp.select_next_item()
	-- 					elseif luasnip.expand_or_jumpable() then
	-- 						luasnip.expand_or_jump()
	-- 					else
	-- 						fallback()
	-- 					end
	-- 				end,
	-- 				["<S-Tab>"]   = function(fallback)
	-- 					if cmp.visible() then
	-- 						cmp.select_prev_item()
	-- 					elseif luasnip.jumpable(-1) then
	-- 						luasnip.jump(-1)
	-- 					else
	-- 						fallback()
	-- 					end
	-- 				end,
	-- 			}),
	-- 			sources = {
	-- 				{ name = "nvim_lsp" },
	-- 				{ name = "luasnip" },
	-- 				{ name = "buffer" },
	-- 				{ name = "path" },
	-- 			},
	-- 		})
	-- 	end,
	-- },
	--

	-- blink.cmp setup
	{
		'saghen/blink.cmp',
		build = 'cargo build --release',
		opts = {
			completion = {
				-- No auto-select
				list = { selection = { preselect = false, auto_insert = true } },

				-- Show documentation when selecting a completion item
				documentation = { auto_show = true, auto_show_delay_ms = 500 },
			},
			sources = {
				-- add lazydev to your completion providers
				default = { 'lazydev', 'lsp', 'path', 'snippets', 'buffer' },
				providers = {
					lazydev = {
						name = 'LazyDev',
						module = 'lazydev.integrations.blink',
						-- make lazydev completions top priority (see :h blink.cmp)
						score_offset = 100,
					},
				},
			},
			keymap = {
				['<Tab>'] = { 'select_next', 'fallback' },
				['<S-Tab>'] = { 'select_prev', 'fallback' },
			},
		},
	},
}
