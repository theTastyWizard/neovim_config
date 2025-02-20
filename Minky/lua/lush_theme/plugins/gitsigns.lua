local lush = require("lush")
local hsl = lush.hsl
local hsluv = lush.hsluv

local Minky = require('lush_theme.Minky')

local theme = lush(function(injected_functions)
	local sym = injected_functions.sym
	return {
		GitSignsAddInline                    { Minky.TermCursor }, -- GitSignsAddInline
		GitSignsDeleteInline                 { Minky.TermCursor }, -- GitSignsDeleteInline
		GitSignsChangeInline                 { Minky.TermCursor }, -- GitSignsChangeInline
		GitSignsCurrentLineBlame             { Minky.NonText }, -- GitSignsCurrentLineBlame
		GitSignsAddLn                        { Minky.DiffAdd }, -- GitSignsAddLn
		GitSignsAddPreview                   { Minky.DiffAdd }, -- GitSignsAddPreview
		GitSignsChangeLn                     { Minky.DiffChange }, -- GitSignsChangeLn
		GitSignsDeletePreview                { Minky.DiffDelete }, -- GitSignsDeletePreview
		GitSignsDeleteVirtLn                 { Minky.DiffDelete }, -- GitSignsDeleteVirtLn
		GitSignsAdd                          { Minky.GitGutterAdd }, -- GitSignsAdd
		GitSignsChange                       { Minky.GitGutterChange }, -- GitSignsChange
		GitSignsDelete                       { Minky.GitGutterDelete }, -- GitSignsDelete
	}
end)
return theme
