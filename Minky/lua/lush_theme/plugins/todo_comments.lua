local lush = require("lush")
local hsl = lush.hsl
local hsluv = lush.hsluv

local theme = lush(function(injected_functions)
	local sym = injected_functions.sym
	return {
		TodoBgWARN { fg = "#120f12", bg = "#007fff", gui = "bold", },                       -- TodoBgWARN     xxx gui=bold guifg=#120f12 guibg=#007fff
		TodoFgWARN { fg = "#007fff", },                                                     -- TodoFgWARN     xxx guifg=#007fff
		TodoSignWARN { fg = "#007fff", bg = "#120f12", },                                   -- TodoSignWARN   xxx guifg=#007fff guibg=#120f12
		TodoBgTODO { fg = "#120f12", bg = "#00ffff", gui = "bold", },                       -- TodoBgTODO     xxx gui=bold guifg=#120f12 guibg=#00ffff
		TodoFgTODO { fg = "#00ffff", },                                                     -- TodoFgTODO     xxx guifg=#00ffff
		TodoSignTODO { fg = "#00ffff", bg = "#120f12", },                                   -- TodoSignTODO   xxx guifg=#00ffff guibg=#120f12
		TodoBgPERF { fg = "#120f12", bg = "#ffa600", gui = "bold", },                       -- TodoBgPERF     xxx gui=bold guifg=#120f12 guibg=#ffa600
		TodoFgPERF { fg = "#ffa600", },                                                     -- TodoFgPERF     xxx guifg=#ffa600
		TodoSignPERF { fg = "#ffa600", bg = "#120f12", },                                   -- TodoSignPERF   xxx guifg=#ffa600 guibg=#120f12
		TodoBgNOTE { fg = "#f5f5f5", bg = "#6600ff", gui = "bold", },                       -- TodoBgNOTE     xxx gui=bold guifg=#f5f5f5 guibg=#6600ff
		TodoFgNOTE { fg = "#6600ff", },                                                     -- TodoFgNOTE     xxx guifg=#6600ff
		TodoSignNOTE { fg = "#6600ff", bg = "#120f12", },                                   -- TodoSignNOTE   xxx guifg=#6600ff guibg=#120f12
		TodoBgFIX { fg = "#120f12", bg = "#ffa600", gui = "bold", },                        -- TodoBgFIX      xxx gui=bold guifg=#120f12 guibg=#ffa600
		TodoFgFIX { fg = "#ffa600", },                                                      -- TodoFgFIX      xxx guifg=#ffa600
		TodoSignFIX { fg = "#ffa600", bg = "#120f12", },                                    -- TodoSignFIX    xxx guifg=#ffa600 guibg=#120f12
		TodoBgTEST { fg = "#120f12", bg = "#ffa600", gui = "bold", },                       -- TodoBgTEST     xxx gui=bold guifg=#120f12 guibg=#ffa600
		TodoFgTEST { fg = "#ffa600", },                                                     -- TodoFgTEST     xxx guifg=#ffa600
		TodoSignTEST { fg = "#ffa600", bg = "#120f12", },                                   -- TodoSignTEST   xxx guifg=#ffa600 guibg=#120f12
		TodoBgHACK { fg = "#120f12", bg = "#007fff", gui = "bold", },                       -- TodoBgHACK     xxx gui=bold guifg=#120f12 guibg=#007fff
		TodoFgHACK { fg = "#007fff", },                                                     -- TodoFgHACK     xxx guifg=#007fff
		TodoSignHACK { fg = "#007fff", bg = "#120f12", },                                   -- TodoSignHACK   xxx guifg=#007fff guibg=#120f12
	}
end)
return theme
