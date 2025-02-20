local lush = require("lush")
local hsl = lush.hsl
local hsluv = lush.hsluv

local Minky = require('lush_theme.Minky')

local theme = lush(function(injected_functions)
	local sym = injected_functions.sym
	return {
		MiniIconsAzure   { Minky.teal },
		MiniIconsBlue    { Minky.blue },
		MiniIconsCyan    { Minky.cyan },
		MiniIconsGreen   { Minky.green2 },
		MiniIconsGrey    { Minky.gray },
		MiniIconsOrange  { Minky.orange },
		MiniIconsPurple  { Minky.purple },
		MiniIconsRed     { Minky.red },
		MiniIconsYellow  { Minky.yellow },
	}
end)
return theme
