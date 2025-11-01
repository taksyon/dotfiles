-- plugins/ui/edgy/config.lua

--     ▌          ▘
--  █▌▛▌▛▌▌▌  ▛▌▌▌▌▛▛▌
--  ▙▖▙▌▙▌▙▌▗ ▌▌▚▘▌▌▌▌
--      ▄▌▄▌

return function(_, opts)
	for _, pos in ipairs({ "top", "bottom", "left", "right" }) do
		opts[pos] = opts[pos] or {}
		table.insert(opts[pos], {
			ft = "snacks_terminal",
			size = { height = 0.15 },
			title =
			"──────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────",
			filter = function(_buf, win)
				return vim.w[win].snacks_win
						and vim.w[win].snacks_win.position == pos
						and vim.w[win].snacks_win.relative == "editor"
						and not vim.w[win].trouble_preview
			end,
		})
	end
end
