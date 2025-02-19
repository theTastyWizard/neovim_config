local lush = require("lush")
local hsl = lush.hsl
local hsluv = lush.hsluv

local modicator = lush(function(injected_functions)
	local sym = injected_functions.sym
	return {
		NormalMode { fg = "#ffa600", bg = "#120f12", },                         -- NormalMode     xxx guifg=#ffa600 guibg=#120f12
		InsertMode { fg = "#ff0066", },                                         -- InsertMode     xxx guifg=#ff0066
		VisualMode { fg = "#00ff66", },                                         -- VisualMode     xxx guifg=#00ff66
		CommandMode { fg = "#6600ff", },                                        -- CommandMode    xxx guifg=#6600ff
		ReplaceMode { fg = "#ffa600", },                                        -- ReplaceMode    xxx guifg=#ffa600
		SelectMode { fg = "#ffa600", },                                         -- SelectMode     xxx guifg=#ffa600
		TerminalMode { fg = "#ffa600", },                                       -- TerminalMode   xxx guifg=#ffa600
		TerminalNormalMode { fg = "#ffa600", },                                 -- TerminalNormalMode xxx guifg=#ffa600
	}
end)
return modicator
