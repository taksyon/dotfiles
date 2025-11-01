--    ▗▖    ▗▄▄▖▗▄▄▖
--    ▐▌   ▐▌   ▐▌ ▐▌
--    ▐▌    ▝▀▚▖▐▛▀▘
--    ▐▙▄▄▖▗▄▄▞▘▐▌


return {


	--    ▖  ▖▄▖▄▖▄▖▖ ▖   --------------------
	--    ▛▖▞▌▌▌▚ ▌▌▛▖▌   --------------------
	--    ▌▝ ▌▛▌▄▌▙▌▌▝▌   --------------------
	--                    --------------------
	-- https://github.com/mason-org/mason.nvim
	{
		'mason-org/mason.nvim',
		dependencies = {
			'mason-org/mason-lspconfig.nvim',
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
					'cmake',
					'csharp_ls',
					'cssls',
					'fish_lsp',
					'gradle_ls',
					'html',
					'hydra_lsp',
					'hyprls',
					'jdtls',
					'jsonls',
					'lua_ls',
					'marksman',
					'pyright',
					'qmlls',
					'systemd_ls',
					'yamlls',
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

			-- local lspconfig = vim.lsp.config()

			local capabilities = vim.lsp.protocol.make_client_capabilities()

			--------------------------------------------------------------------------
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
					capabilities = capabilities
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
					capabilities = capabilities
				},

				--    ▌       ▜
				--    ▛▌▌▌▛▌▛▘▐ ▛▘
				--    ▌▌▙▌▙▌▌ ▐▖▄▌
				--      ▄▌▌
				hyprls = { capabilities = capabilities, },

				--     ▘ ▌▗ ▜
				--     ▌▛▌▜▘▐ ▛▘
				--     ▌▙▌▐▖▐▖▄▌
				--    ▙▌
				--
				-- https://github.com/mfussenegger/nvim-jdtls
				-- https://github.com/eclipse/eclipse.jdt.ls/wiki/Running-the-JAVA-LS-server-from-the-command-line#initialize-request
				jdtls = {
					cmd = { "jdtls" },
					root_dir = vim.fs.root(0, { 'gradlew', '.git', 'mvnw', '.project', 'src' }),
					settings = {
						java = {
							project = {
								sourcePaths = { "." }, -- or "." if you really want flat
								referencedLibraries = {} -- add jars if you have any
							},
							format = {
								settings = {
									-- Use Google Java style guidelines for formatting
									-- To use, make sure to download the file from https://github.com/google/styleguide/blob/gh-pages/eclipse-java-google-style.xml
									-- and place it in the ~/.local/share/eclipse directory
									-- url = "/.local/share/eclipse/eclipse-java-google-style.xml",
									-- profile = "GoogleStyle",
								},
							},
						}
					},
					capabilities = capabilities,
				},

				--   ▘      ▜
				--   ▌▛▘▛▌▛▌▐ ▛▘
				--   ▌▄▌▙▌▌▌▐▖▄▌
				--  ▙▌

				jsonls = { capabilities = capabilities },


				--  ▜     ▜
				--  ▐ ▌▌▀▌▐ ▛▘
				--  ▐▖▙▌█▌▐▖▄▌

				lua_ls = { capabilities = capabilities },

				--        ▘  ▌ ▗
				--  ▛▌▌▌▛▘▌▛▌▛▌▜▘
				--  ▙▌▙▌▌ ▌▙▌▌▌▐▖
				--  ▌ ▄▌   ▄▌

				pyright = { capabilities = capabilities },

				--       ▜ ▜
				--  ▛▌▛▛▌▐ ▐ ▛▘
				--  ▙▌▌▌▌▐▖▐▖▄▌
				--   ▌

				qmlls = { capabilities = capabilities },
				-- rust_analyzer = {},

			}
			-----------------------------------------------------------------------------

			for name, overrides in pairs(servers) do
				-- Build config from default settings w/ my overrides
				vim.lsp.config(name, overrides)
				vim.lsp.enable(name)
			end
		end,
	},
	-- END MASON ----------------


	--          ▗             ▘
	--    ▛▘▌▌▛▘▜▘▀▌▛▘█▌▀▌▛▌▌▌▌▛▛▌
	--    ▌ ▙▌▄▌▐▖█▌▙▖▙▖█▌▌▌▚▘▌▌▌▌
	--
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
	-- {
	-- 	'mfussenegger/nvim-jdtls',
	--
	-- },


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

	--    ▛▌█▌▛▌▛▌█▌▛▌
	--    ▌▌▙▖▙▌▙▌▙▖▌▌
	--          ▄▌
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
		dependencies = { 'mason-org/mason.nvim' },
		opts = {
			-- format_on_save   = {
			--   lsp_fallback = true,
			--   timeout_ms   = 1000,
			-- },
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
						'4',
						'--tab-size',
						'4',
						'--line-length',
						'100',
					},
				},
			},
		},
	},
}
