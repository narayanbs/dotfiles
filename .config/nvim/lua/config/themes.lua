vim.cmd("colorscheme monokai-pro")

-- Disable all italics (it's broken, waiting on https://github.com/loctvl842/monokai-pro.nvim/issues/136)
local disable_italics = function()
	for _, group in ipairs(vim.fn.getcompletion("", "highlight")) do
		local ok, hl = pcall(vim.api.nvim_get_hl, 0, { name = group, link = false })
		if ok and hl and hl.italic then
			hl.italic = false
			vim.api.nvim_set_hl(0, group, hl)
		end
	end
end

disable_italics()
