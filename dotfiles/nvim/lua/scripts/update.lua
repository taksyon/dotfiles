local cachefile = vim.fn.stdpath("cache") .. "/lazy_tsupdate.date"
local today = os.date("%Y-%m-%d")

local function get_last_run_date()
	local f = io.open(cachefile, "r")
	if f then
		local date = f:read("*l")
		f:close()
		return date
	end
	return nil
end

local function set_last_run_date(date)
	local ok, err = pcall(function()
		local f = assert(io.open(cachefile, "w+"))
		f:write(date .. "\n")
		f:close()
	end)
	if not ok then
		vim.notify("Failed to write cachefile: " .. err, vim.log.levels.ERROR)
	end
end

if get_last_run_date() ~= today then
	vim.api.nvim_create_autocmd("VimEnter", {
		once = true,
		callback = function()
			vim.schedule(function()
				require("lazy").sync()
				local ok = pcall(require, "nvim-treesitter.configs")
				if ok then
					vim.cmd("TSUpdate")
				else
					vim.notify("nvim-treesitter not loaded, skipping TSUpdate", vim.log.levels.WARN)
				end
				vim.notify("Running TSUpdate + Lazy.sync (once today)")
				set_last_run_date(today)
			end)
		end,
	})
end
