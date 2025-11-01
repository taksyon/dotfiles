-- vim.cmd('colorscheme industry')
-- vim.cmd('colorscheme ashen')
vim.cmd('colorscheme moonfly')


-- -- vim.cmd('colorscheme NeoCyberVim')
local myHighlights = {
	Normal      = { bg = 'black' },
	-- 	-- Comment                    = { fg = '#00ff00' },
	-- 	Delimiter                   = { link = 'Normal' },
	EndOfBuffer = { fg = 'black' },
	-- 	ErrorMsg                    = { fg = '#ff0000', bg = '#11133c' },
	-- 	Function                    = { link = 'Macro' },
	-- 	SnacksIndent                = { fg = '#444444' },
	-- 	SnacksIndentScope           = { link = "Number" },
	-- 	StatusLine                  = { link = 'Normal' },
	-- 	StatusLineNC                = { link = 'Normal' },
	-- 	StatusLineTerm              = { link = 'Normal' },
	-- 	StatusLineTermNC            = { link = 'Normal' },
	-- 	CursorLine                  = { bg = '#003a2c' },
	-- 	CursorColumn                = { bg = 'NONE' },
	-- 	LspReferenceText            = { bg = 'NONE' },
	-- 	LspSignatureActiveParameter = { bg = 'NONE' },
	-- 	Pmenu                       = { link = 'Normal' },
	-- 	PmenuKind                   = { link = 'Function' },
	-- 	PmenuExtra                  = { link = 'Include' },
	-- 	-- WinBar                     = { fg = 'NONE', bg = 'NONE' },
	-- 	SnacksNormal                = { link = 'Normal' },
	-- 	SnacksNormalNC              = { link = 'Normal' },
	-- 	SnacksPicker                = { link = 'Normal' },
	-- 	FloatBorder                 = { link = 'Normal' },
	-- 	-- SnacksPickerListBorder     = { link = "PreProc" },
	-- 	SnacksPickerTree            = { link = 'Special' },
	-- 	VertSplit                   = { fg = 'NONE', bg = 'NONE' },
	-- 	EdgyNormal                  = { link = 'Normal' },
	-- 	-- Visual                     = { link = 'PmenuMatch' },
	-- 	NoicePopup                  = { link = 'Normal' },
	-- 	NoiceCmdlineIcon            = { link = 'Special' },
	-- 	NoiceCmdlinePopupBorder     = { link = 'Function' },
	-- 	NoiceCmdlinePopupTitleHelp  = { link = 'Title' },
	-- 	NormalFloat                 = { bg = "#000001" },
}

for group, opts in pairs(myHighlights) do
	vim.api.nvim_set_hl(0, group, opts)
end
