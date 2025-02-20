local lush = require("lush")
local hsl = lush.hsl
local hsluv = lush.hsluv

local Minky = require('lush_theme.Minky')

local blink = lush(function(injected_functions)
	local sym = injected_functions.sym
	return {
		-- BlinkCmpMenu {}, --Pmenu	The completion menu window
		-- BlinkCmpMenuBorder {}, --	Pmenu	The completion menu window border
		-- BlinkCmpMenuSelection {}, --PmenuSel	The completion menu window selected item
		-- BlinkCmpScrollBarThumb {}, --PmenuThumb	The scrollbar thumb
		-- BlinkCmpScrollBarGutter {}, --PmenuSbar	The scrollbar gutter
		-- BlinkCmpLabel {},       --Pmenu	Label of the completion item
		-- BlinkCmpLabelDeprecated {}, --NonText	Deprecated label of the completion item
		-- BlinkCmpLabelMatch {},  --Pmenu	(Currently unused) Label of the completion item when it matches the query
		-- BlinkCmpLabelDetail {}, --NonText	Label description of the completion item
		-- BlinkCmpLabelDescription {}, --NonText	Label description of the completion item
		-- BlinkCmpSource {},                 --NonText	Source of the completion item
		-- BlinkCmpGhostText {},              --NonText	Preview item with ghost text
		-- BlinkCmpDoc {},                    --NormalFloat	The documentation window
		-- BlinkCmpDocBorder {},              --NormalFloat	The documentation window border
		-- BlinkCmpDocSeparator {},           --NormalFloat	The documentation separator between doc and detail
		-- BlinkCmpDocCursorLine {},          --Visual	The documentation window cursor line
		-- BlinkCmpSignatureHelp {},          --NormalFloat	The signature help window
		-- BlinkCmpSignatureHelpBorder {},    --NormalFloat	The signature help window border
		BlinkCmpSignatureHelpActiveParameter { Minky.Visual }, --LspSignatureActiveParameter	Active parameter of the signature help --TODO: finna aðeins sýnilegra yfirlag
		BlinkCmpKindClass { Minky.TSType },
		BlinkCmpKindConstant { Minky.Constant },
		BlinkCmpKindConstructor { Minky.TSConstructor },
		BlinkCmpKindEnum { Minky.TSType },
		BlinkCmpKindEnumMember { Minky.Constant },
		BlinkCmpKindEvent { Minky.Constant },
		BlinkCmpKindField { Minky.magenta1 },
		BlinkCmpKindFunction { Minky.Function },
		BlinkCmpKindInterface { Minky.Structure },
		BlinkCmpKindKeyword { Minky.TSKeyword },
		BlinkCmpKindMethod { Minky.TSMethod },
		BlinkCmpKindModule { Minky.Special },
		BlinkCmpKindOperator { Minky.Operator },
		BlinkCmpKindProperty { Minky.TSProperty },
		BlinkCmpKindReference { Minky.TSParameterReference },
		BlinkCmpKindSnippet { Minky.grunn04 },
		BlinkCmpKindStruct { Minky.TSStruct },
		-- BlinkCmpKindTypeParameter { Minky.sym "@variable.parameter.builtin" },
		-- BlinkCmpKindUnit                               { CmpItemKindUnit },
		-- BlinkCmpKindValue                              { CmpItemKindValue },
		BlinkCmpKindVariable { Minky.TSVariable },
		BlinkCmpKindFile { Minky.Teal }
		-- BlinkCmpKindText { Minky.1}
		-- BlinkCmpKindSnippet { BlinkCmpKindVariable }



	}
end)
return blink
