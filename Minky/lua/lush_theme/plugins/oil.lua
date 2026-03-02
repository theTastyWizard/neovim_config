local lush = require("lush")
local hsl = lush.hsl
local hsluv = lush.hsluv

local Minky = require('lush_theme.Minky')

local theme = lush(function(injected_functions)
	local sym = injected_functions.sym
	return {
		OilGitAdded                    { Minky.DiffAdd }, -- GitSignsAddInline
		OilGitModified                 { Minky.DiffChange }, -- GitSignsChangeInline
		OilGitRenamed				   { Minky.Blue1 }, -- GitSignsCurrentLineBlame
		OilGitDeleted                  { Minky.DiffDelete }, -- GitSignsDeleteInline
		OilGitCopied                   { Minky.DiffAdd }, -- GitSignsAddLn
		OilGitConflict				   { Minky.Orange }, -- GitSignsAddPreview
		OilGitUntracked                { Minky.Teal }, -- GitSignsChangeLn
		-- OilGitIgnored                  { Minky.Yellow }, -- GitSignsDeletePreview
	}
end)
return theme
