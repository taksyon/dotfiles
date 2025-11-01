return function()
	require("noice").setup({
		cmdline = {
			enabled = true,      -- Enables command-line UI
			view = "cmdline_popup", -- Uses a floating window for the command line
		},
		messages = {
			enabled = false,
			view = "notify",    -- Routes messages to nvim-notify if installed
			view_error = "notify", -- Ensures errors use notify as well
			view_warn = "notify",
			view_history = 'messages',
		},
		popupmenu = {
			enabled = false, -- Enables custom popup menu for command-line completion
			backend = "nui", -- Uses `nui.nvim` for UI elements
		},
		lsp = {
			hover = {
				enabled = true, -- Set to `true` if you don’t use another hover UI (e.g., lspsaga)
			},
			signature = {
				enabled = false, -- Disables LSP signature help (use `lsp_signature.nvim` if needed)
			},
		},
		presets = {
			bottom_search = true,      -- Moves search UI to the bottom
			command_palette = true,    -- Similar to VS Code’s command palette
			long_message_to_split = true, -- Redirects long messages to a split
			inc_rename = false,        -- Disable incremental renaming (use `inc-rename.nvim` if needed)
		},
		routes = {
			{
				filter = { event = "msg_show", min_length = 10 },
				view = "notify", -- Routes long messages to notify
			},

			--    ▐▘▘▜ ▗
			--    ▜▘▌▐ ▜▘█▌▛▘▛▘
			--    ▐ ▌▐▖▐▖▙▖▌ ▄▌
			--
			{
				filter = {
					event = "msg_show",
					kind = "warning",
					find = "lines changed", -- Matches messages like 'x lines changed'
				},
			},
			{
				filter = {
					event = "lsp",
					kind = "progress",
					cond = function(message)
						local client = vim.tbl_get(message.opts, "progress", "client")
						return client == "lua_ls" or "jdtls"
						-- return vim.bo.filetype == "java"
					end,
				},
				opts = { skip = true },
			}
		},
	})
end
