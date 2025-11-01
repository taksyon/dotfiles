--    ▗▖ ▗▖▗▄▄▄▖▗▄▄▄▖▗▖
--    ▐▌ ▐▌  █    █  ▐▌
--    ▐▌ ▐▌  █    █  ▐▌
--    ▝▚▄▞▘  █  ▗▄█▄▖▐▙▄▄▖
--
--
--

return {

	--                ▗
	--  ▛▘▛▌▛▛▌▛▛▌█▌▛▌▜▘
	--  ▙▖▙▌▌▌▌▌▌▌▙▖▌▌▐▖
	--
	-- https://github.com/numToStr/Comment.nvim?tab=readme-ov-file#configuration-optional
	{
		'numToStr/Comment.nvim',
		event = 'BufReadPost',
		config = function()
			require('Comment').setup()
		end,
	},

	--    ▌    ▌
	--    ▛▌▌▌▛▌▛▘▀▌
	--    ▌▌▙▌▙▌▌ █▌
	--      ▄▌
	{
		'nvimtools/hydra.nvim',
		config = function()
			local Hydra = require('hydra')

			Hydra({
				name = 'Fast Nav',
				mode = 'n',
				body = '<leader>hh', -- triggers the hydra
				hint = '  hydra',
				config = {
					color = 'pink', -- stays active until exit key is pressed
					invoke_on_body = true,
					hint = {
						type = 'window',
						position = 'bottom-right',
						offset = 3,
						show_name = true,
						float_opts = {
							-- row, col, height, width, relative, and anchor should not be
							-- overridden
							style = 'minimal',
							focusable = false,
							noautocmd = true,
							border = 'rounded',
						},
					},
				},
				heads = {
					{ 'j',     '5j', { desc = 'down 5' } },
					{ 'k',     '5k', { desc = 'up 5' } },
					{ 'h',     '5h', { desc = 'left 5' } },
					{ 'l',     '5l', { desc = 'right 5' } },
					{ '<Esc>', nil,  { exit = true } },
					{ 'q',     nil,  { exit = true } },
				}
			})
		end
	},

	--     ▘  ▘                 ▌
	--  ▛▛▌▌▛▌▌  ▛▘▌▌▛▘▛▘▛▌▌▌▛▌▛▌
	--  ▌▌▌▌▌▌▌▗ ▄▌▙▌▌ ▌ ▙▌▙▌▌▌▙▌
	--
	-- https://github.com/echasnovski/mini.surround?tab=readme-ov-file#default-config
	{
		'nvim-mini/mini.surround',
		event = 'VeryLazy',
		config = function()
			require('mini.surround').setup()
		end,
	},

	--       ▜ ▗ ▘
	--  ▛▛▌▌▌▐ ▜▘▌▛▘▌▌▛▘▛▘▛▌▛▘▛▘
	--  ▌▌▌▙▌▐▖▐▖▌▙▖▙▌▌ ▄▌▙▌▌ ▄▌
	--
	-- https://github.com/smoka7/multicursors.nvim?tab=readme-ov-file#default-configuration
	{
		'smoka7/multicursors.nvim',
		event = 'VeryLazy',
		dependencies = {
			'nvimtools/hydra.nvim',
		},
		opts = {
			-- === Custom Mappings for Editing Selections ===
			normal_keys = {
				['<C-/>'] = {
					method = function()
						require('multicursors.utils').call_on_selections(function(selection)
							vim.api.nvim_win_set_cursor(
								0,
								{ selection.row + 1, selection.col + 1 }
							)
							local line_count = selection.end_row - selection.row + 1
							vim.cmd('normal ' .. line_count .. 'gcc') -- Comments selection
						end)
					end,
					opts = { desc = 'Comment selections' },
				},
			},

			hint_config = { -- vertical hints
				float_opts = { border = 'rounded' },
			},
		},
		cmd = {
			'MCstart',
			'MCvisual',
			'MCclear',
			'MCpattern',
			'MCvisualPattern',
			'MCunderCursor',
		},
		keys = {
			{
				mode = { 'v', 'n' },
				'<Leader>m',
				'<cmd>MCstart<cr>',
				desc = 'Create a selection for selected text or word under the cursor',
			},
		},
	},

	--          ▘▗
	--  ▛▌█▌▛▌▛▌▌▜▘
	--  ▌▌▙▖▙▌▙▌▌▐▖
	--        ▄▌
	-- https://github.com/NeogitOrg/neogit?tab=readme-ov-file#configuration
	{
		'NeogitOrg/neogit',
		event = 'VeryLazy',
		dependencies = {
			'nvim-lua/plenary.nvim', -- required
			'sindrets/diffview.nvim',
			'folke/snacks.nvim',
		},
	},

	--      ▘         ▗       ▘
	--  ▛▌▌▌▌▛▛▌▄▖▀▌▌▌▜▘▛▌▛▌▀▌▌▛▘▛▘
	--  ▌▌▚▘▌▌▌▌  █▌▙▌▐▖▙▌▙▌█▌▌▌ ▄▌
	--                    ▌
	-- https://github.com/windwp/nvim-autopairs?tab=readme-ov-file#default-values
	{
		'windwp/nvim-autopairs',
		event = 'VeryLazy',
		config = true,
		opts = {
			disable_filetype = { 'TelescopePrompt', 'vim', 'txt' }, -- Disable for certain filetypes
			check_ts = true,                                     -- Enable treesitter integration
			ignored_next_char = [=[[%w%%%'%[%"%.%`%$%\\]]=],
		},
	},

	--                          ▘
	--    ▛▌▌▌█▌▛▘▛▘█▌█▌▛▘  ▛▌▌▌▌▛▛▌
	--    ▙▌▚▘▙▖▌ ▄▌▙▖▙▖▌ ▗ ▌▌▚▘▌▌▌▌
	{
		'stevearc/overseer.nvim',
		opts = {},
	},

	--  ▖▖▘   ▄▖  ▖▖
	--  ▌▌▌▛▛▌▐ █▌▚▘
	--  ▚▘▌▌▌▌▐ ▙▖▌▌
	--
	-- https://github.com/lervag/vimtex?tab=readme-ov-file#configuration
	{
		'lervag/vimtex',
		ft = { 'tex' },                         -- Load VimTeX only when opening a .tex file
		config = function()
			vim.g.vimtex_view_method = 'zathura'  -- Use Zathura as the default PDF viewer
			vim.g.vimtex_compiler_method = 'latexmk' -- Use latexmk for auto-compilation
			vim.g.vimtex_compiler_latexmk = {
				callback = 1,
				continuous = 1,
				executable = 'latexmk',
				options = {
					'-pdf',
					'-interaction=nonstopmode',
					'-synctex=1',
					'-shell-escape', -- Needed for some TikZ features
				},
			}

			-- Automatically refresh the PDF viewer when compilation is complete
			vim.g.vimtex_view_general_viewer = 'zathura'
			vim.g.vimtex_view_general_options = '--synctex-forward @line:@col:@tex'

			-- Enable automatic indentation and syntax highlighting
			vim.g.vimtex_syntax_enabled = 1
			vim.g.vimtex_indent_enabled = 1

			-- Custom keybindings for convenience
			vim.api.nvim_set_keymap(
				'n',
				'<Leader>ll',
				':VimtexCompile<CR>',
				{ noremap = true, silent = true, desc = 'Compile LaTeX' }
			)
			vim.api.nvim_set_keymap(
				'n',
				'<Leader>lv',
				':VimtexView<CR>',
				{ noremap = true, silent = true, desc = 'View PDF' }
			)
			vim.api.nvim_set_keymap(
				'n',
				'<Leader>lc',
				':VimtexClean<CR>',
				{ noremap = true, silent = true, desc = 'Clean auxiliary files' }
			)
		end,
	},
}
