--      ▗                  ▌
--  ▀▌▌▌▜▘▛▌▛▘▛▌▛▛▌▛▛▌▀▌▛▌▛▌▛▘
--  █▌▙▌▐▖▙▌▙▖▙▌▌▌▌▌▌▌█▌▌▌▙▌▄▌


-- vim.api.nvim_create_autocmd("FileType", {
-- 	pattern = "python",
-- 	callback = function()
-- 		vim.api.nvim_buf_set_keymap(0, "n", "K", ":lua PyDocs()<CR>", { noremap = true, silent = true })
-- 	end,
-- })

vim.api.nvim_create_augroup("FileTypeDetection", { clear = true })

vim.api.nvim_create_autocmd("BufRead", {
	group = "FileTypeDetection",
	pattern = "*",
	callback = function()
		if not vim.fn.expand('%:e') then -- Check if the file has no extension
			vim.bo.filetype = "conf"       -- Set filetype to 'conf'
		end
	end,
})
-- Remove auto comment-inserting
vim.api.nvim_create_autocmd("FileType", {
	pattern = "*",
	callback = function()
		vim.opt_local.formatoptions:remove({ "c", "r" })
	end,
})

-- Sqlfluff lint on save
vim.api.nvim_create_augroup("SqlfluffLint", { clear = true })

vim.api.nvim_create_autocmd("BufWritePost", {
	pattern = "*.sql",
	group = "SqlfluffLint",
	callback = function()
		-- Use vim.fn to execute shell command and print results
		local filename = vim.fn.expand("%")
		local output = vim.fn.system("sqlfluff lint " .. filename .. " --dialect mariadb")
		-- Output to messages
		vim.notify(output, vim.log.levels.INFO, { title = "SQLFluff" })
	end,
})


-- rust tab width
vim.api.nvim_create_autocmd("FileType", {
	pattern = "rust",
	callback = function()
		vim.bo.tabstop = 2
		vim.bo.shiftwidth = 2
		vim.bo.softtabstop = 2
		vim.bo.expandtab = false
	end,
})

-- conf tab width
vim.api.nvim_create_autocmd("FileType", {
	pattern = "*.conf",
	callback = function()
		vim.bo.tabstop = 2
		vim.bo.shiftwidth = 2
		vim.bo.softtabstop = 2
		vim.bo.expandtab = false
	end,
})
-- -- QML tab width
-- vim.api.nvim_create_autocmd("FileType", {
--   pattern = "qml",
--   callback = function()
--     vim.bo.tabstop = 4
--     vim.bo.shiftwidth = 4
--     vim.bo.softtabstop = 4
--     vim.bo.expandtab = false
--   end,
-- })
