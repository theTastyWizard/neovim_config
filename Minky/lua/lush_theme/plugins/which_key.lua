local lush = require("lush")
local hsl = lush.hsl
local hsluv = lush.hsluv

local Minky = require('lush_theme.Minky')

local theme = lush(function(injected_functions)
	local sym = injected_functions.sym
	return {
		WhichKey { Minky.Function },
		WhichKeyNormal { Minky.NormalFloat },
		WhichKeyBorder { Minky.FloatBorder },
		WhichKeyGroup { Minky.Keyword }, -- group name
		WhichKeySeparator { Minky.Comment }, --seperator between key and its description
		WhichKeyValue { Minky.Comment }, -- values by plugins (like marks, registers, etc)
		WhichKeyDesc { Minky.Identifier }, -- description
		WhichKeyIconAzure { Minky.teal },
		WhichKeyIconBlue { Minky.blue },
		WhichKeyIconCyan { Minky.cyan },
		WhichKeyIconGreen { Minky.green2 },
		WhichKeyIconGrey { Minky.gray },
		WhichKeyIconOrange { Minky.orange },
		WhichKeyIconPurple { Minky.purple },
		WhichKeyIconRed { Minky.red },
		WhichKeyIconYellow { Minky.yellow },
	}
end)
return theme
