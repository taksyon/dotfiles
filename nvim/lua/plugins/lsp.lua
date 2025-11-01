--  ▜       ▜
--  ▐ ▛▘▛▌  ▐ ▌▌▀▌
--  ▐▖▄▌▙▌▗ ▐▖▙▌█▌
--      ▌


return {


	--  ▛▛▌▀▌▛▘▛▌▛▌
	--  ▌▌▌█▌▄▌▙▌▌▌
	--
	-- https://github.com/mason-org/mason.nvim
	{
		'mason-org/mason.nvim',
		dependencies = {
			'williamboman/mason-lspconfig.nvim',
			'neovim/nvim-lspconfig',
		},
		config = function()
			require('mason').setup({
				ui = {
					border = 'rounded',
				},
			})
			require('mason-lspconfig').setup({
				ensure_installed = {
					'bashls',
					'clangd',
					'jdtls',
					'jsonls',
					'lua_ls',
					'pyright',
					'qmlls',
					-- 'rust_analyzer',
					-- 'sqls',
				},
				automatic_enable = false,
			})


			--  ▜           ▐▘▘
			--  ▐ ▛▘▛▌▛▘▛▌▛▌▜▘▌▛▌
			--  ▐▖▄▌▙▌▙▖▙▌▌▌▐ ▌▙▌
			--      ▌          ▄▌
			-- https://github.com/neovim/nvim-lspconfig

			local lspconfig = require('lspconfig')

			local servers = {

				--  ▌     ▌ ▜
				--  ▛▌▀▌▛▘▛▌▐ ▛▘
				--  ▙▌█▌▄▌▌▌▐▖▄▌
				--
				bashls = {
					settings = {
						bashIde = {
							shellcheck = {
								enable = false,
							},
						},
					},
				},

				--    ▜        ▌
				--  ▛▘▐ ▀▌▛▌▛▌▛▌
				--  ▙▖▐▖█▌▌▌▙▌▙▌
				--          ▄▌
				--
				clangd = {
					cmd = {
						'clangd',
						'--background-index',
						'--clang-tidy',
						'--completion-style=detailed',
						'--header-insertion=iwyu',
						'--cross-file-rename',
					},
					init_options = {
						-- Fallback flags in case compile_commands.json is missing
						fallbackFlags = {
							'-std=c++17',
							'-I./',
							'-I/usr/include',
							'-I/usr/local/include'
						},
					},
				},

				--   ▘ ▌▗ ▜
				--   ▌▛▌▜▘▐ ▛▘
				--   ▌▙▌▐▖▐▖▄▌
				--  ▙▌

				-- SEE ../config/java.lua
				-- jdtls = {
				-- 	-- root_dir = vim.fs.root(0, { '.project', 'pom.xml', 'build.gradle', 'settings.gradle', 'gradlew', 'mvnw',
				-- 	-- 	'.git' }),
				-- 	-- cmd = { 'jdtls', '-data', '~/java-ws/.jdtls-workspace' },
				-- },

				--   ▘      ▜
				--   ▌▛▘▛▌▛▌▐ ▛▘
				--   ▌▄▌▙▌▌▌▐▖▄▌
				--  ▙▌

				jsonls = {},

				--  ▜     ▜
				--  ▐ ▌▌▀▌▐ ▛▘
				--  ▐▖▙▌█▌▐▖▄▌
				--

				lua_ls = {},

				--        ▘  ▌ ▗
				--  ▛▌▌▌▛▘▌▛▌▛▌▜▘
				--  ▙▌▙▌▌ ▌▙▌▌▌▐▖
				--  ▌ ▄▌   ▄▌

				pyright = {},

				--       ▜ ▜
				--  ▛▌▛▛▌▐ ▐ ▛▘
				--  ▙▌▌▌▌▐▖▐▖▄▌
				--   ▌

				qmlls = {},
				-- rust_analyzer = {},

			}

			-- Loop thru, set up servers
			for server, config in pairs(servers) do
				if server ~= 'jdtls' then lspconfig[server].setup(config) end
			end
		end,
	},

	{
		'mrcjkb/rustaceanvim',
		version = '^6', -- Recommended
		lazy = false, -- This plugin is already lazy
	},

	--   ▘
	--   ▌▀▌▌▌▀▌
	--   ▌█▌▚▘█▌
	--  ▙▌
	-- https://github.com/mfussenegger/nvim-jdtls?tab=readme-ov-file#configuration-quickstart
	{
		'mfussenegger/nvim-jdtls',
		ft = 'java',
		config = function()
			local jdtls = require('jdtls')
			local root_markers = {
				'.git',
				'mvnw',
				'gradlew',
				'pom.xml',
				'build.gradle',
				'settings.gradle',
				'.root',
				'src',
			}
			local root_dir = require('lspconfig.util').root_pattern(
				unpack(root_markers)
			)(vim.fn.getcwd()) or vim.fn.getcwd() -- Fallback if no markers found

			local project_name = vim.fn.fnamemodify(root_dir, ':p:h:t')
			local workspace_dir = vim.fn.stdpath('cache')
					.. '/jdtls/workspace/'
					.. project_name

			jdtls.start_or_attach({
				cmd = {
					vim.fn.stdpath('data') .. '/mason/packages/jdtls/bin/jdtls',
					'--data',
					workspace_dir,
				},
				root_dir = root_dir,
				-- Optional: capabilities, settings, on_attach...
			})
		end,
	},


	--  ▜
	--  ▐ ▛▘▛▌▛▘▀▌▛▌▀▌
	--  ▐▖▄▌▙▌▄▌█▌▙▌█▌
	--      ▌     ▄▌
	-- https://nvimdev.github.io/lspsaga/
	{
		'nvimdev/lspsaga.nvim',
		dependencies = { 'neovim/nvim-lspconfig' },
		config = function()
			require('lspsaga').setup({
				symbol_in_winbar = {
					enable = false,
				},
				ui = {
					border = 'rounded',
					code_action = '',
				},
				diagnostic = {
					-- diagnostic_only_current = true
				},
			})
			-- Keybindings for Lspsaga functionality
			local keymap = vim.keymap.set
			local opts = { noremap = true, silent = true }
			keymap('n', 'gd', '<cmd>Lspsaga goto_definition<CR>', opts)
			keymap('n', '<leader>ca', '<cmd>Lspsaga code_action<CR>', opts)
			keymap('n', 'gr', '<cmd>Lspsaga finder<CR>', opts)
		end,
	},
	--
	-- {
	--   "mfussenegger/nvim-lint",
	--   config = function()
	--     require("lint").linters_by_ft = {
	--       sql = { "sqlfluff" },
	--     }
	--
	--     vim.api.nvim_create_autocmd("BufWritePost", {
	--       pattern = "*.sql",
	--       callback = function()
	--         require("lint").try_lint()
	--       end,
	--     })
	--   end,
	-- },


	--  ▗       ▌ ▜
	--  ▜▘▛▘▛▌▌▌▛▌▐ █▌
	--  ▐▖▌ ▙▌▙▌▙▌▐▖▙▖
	--
	-- https://github.com/folke/trouble.nvim?tab=readme-ov-file#%EF%B8%8F-configuration
	{
		'folke/trouble.nvim',
		dependencies = { 'kyazdani42/nvim-web-devicons' },
		config = function() require('trouble').setup() end,
	},


	--  ▌
	--  ▛▌▛▌▌▌█▌▛▘
	--  ▌▌▙▌▚▘▙▖▌
	--
	-- https://github.com/lewis6991/hover.nvim?tab=readme-ov-file
	{
		'lewis6991/hover.nvim',
		config = function()
			require('hover').config({
				providers = {
					-- 'hover.providers.diagnostic',
					'hover.providers.lsp',
					'hover.providers.dap',
					'hover.providers.man',
					-- 'hover.providers.dictionary',
					-- Optional, disabled by default:
					-- 'hover.providers.gh',
					-- 'hover.providers.gh_user',
					-- 'hover.providers.jira',
					-- 'hover.providers.fold_preview',
					-- 'hover.providers.highlight',
				},
				mouse_providers = {
					'hover.providers.lsp',
				},
				preview_opts = {
					border = 'rounded',
				},
				title = true,
			})
		end,
	},

	-- vim-doge
	-- -- https://github.com/kkoomen/vim-doge?tab=readme-ov-file#configuration
	-- {
	-- 	'kkoomen/vim-doge',
	-- },
	{
		"danymat/neogen",
		config = true,
		-- Uncomment next line if you want to follow only stable versions
		-- version = "*"
	},


	--        ▐▘
	--  ▛▘▛▌▛▌▜▘▛▌▛▘▛▛▌
	--  ▙▖▙▌▌▌▐ ▙▌▌ ▌▌▌
	--
	-- https://github.com/stevearc/conform.nvim?tab=readme-ov-file#setup
	{
		'stevearc/conform.nvim',
		event = { 'BufReadPre', 'BufNewFile' },
		cmd = { 'ConformInfo' },
		dependencies = { 'williamboman/mason.nvim' },
		opts = {
			format_on_save   = {
				lsp_fallback = true,
				timeout_ms   = 1000,
			},
			formatters_by_ft = { -- Formatters
				lua        = { lsp_format = 'prefer' },
				python     = { 'black' },
				javascript = { 'prettier' },
				java       = { 'clang-format' },
				typescript = { 'prettier' },
				sh         = { 'shfmt' },
				c          = { 'clang-format' },
				cpp        = { 'clang-format' },
				sql        = { 'sqlfluff' },
				qml        = { 'qmlfmt' },
				rust       = { 'rustfmt' },
			},

			formatters       = {
				qmlfmt = {
					command = 'qmlfmt',
					args = {
						'--indent',
						'2',
						'--tab-size',
						'2',
						'--line-length',
						'100',
					},
				},
			},
		},
	},
}
