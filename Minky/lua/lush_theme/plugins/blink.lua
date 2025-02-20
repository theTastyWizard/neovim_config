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
		-- BlinkCmpSignatureHelpActiveParameter {}, --LspSignatureActiveParameter	Active parameter of the signature help
		BlinkCmpKindClass { Minky.TSType }, -- BlinkCmpKindClass xxx links to CmpItemKindClass
		BlinkCmpKindConstant { Minky.Constant },
		BlinkCmpKindConstructor { Minky.TSConstructor },
		BlinkCmpKindEnum { Minky.TSType },
		BlinkCmpKindEnumMember { Minky.Constant },
		BlinkCmpKindEvent { Minky.Constant },
		BlinkCmpKindField { Minky.TSField },
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


		-- BlinkCmpLabel                                  { CmpItemAbbr }, -- BlinkCmpLabel  xxx links to CmpItemAbbr
		-- BlinkCmpLabelDeprecated                        { CmpItemAbbrDeprecated }, -- BlinkCmpLabelDeprecated xxx links to CmpItemAbbrDeprecated
		-- BlinkCmpLabelDescription                       { CmpItemMenu }, -- BlinkCmpLabelDescription xxx links to CmpItemMenu
		-- BlinkCmpLabelDetail                            { CmpItemMenu }, -- BlinkCmpLabelDetail xxx links to CmpItemMenu
		-- BlinkCmpLabelMatch                             { CmpItemAbbrMatch }, -- BlinkCmpLabelMatch xxx links to CmpItemAbbrMatch
		-- BlinkCmpSource                                 { CmpItemMenu }, -- BlinkCmpSource xxx links to CmpItemMenu

		-- CmpDocumentation                               { fg="#f5f5f5", bg="#120f12", }, -- CmpDocumentation xxx guifg=#f5f5f5 guibg=#120f12
		-- CmpDocumentationBorder                         { fg="#f5f5f5", bg="#120f12", }, -- CmpDocumentationBorder xxx guifg=#f5f5f5 guibg=#120f12
		-- CmpItemAbbr                                    { fg="#f5f5f5", bg="#1b181b", }, -- CmpItemAbbr    xxx guifg=#f5f5f5 guibg=#1b181b
		-- CmpItemAbbrDeprecated                          { fg="#117c3c", gui="strikethrough", }, -- CmpItemAbbrDeprecated xxx cterm=strikethrough gui=strikethrough guifg=#117c3c
		-- CmpItemAbbrMatch                               { fg="#00ffff", }, -- CmpItemAbbrMatch xxx guifg=#00ffff
		-- CmpItemAbbrMatchFuzzy                          { fg="#00ffff", }, -- CmpItemAbbrMatchFuzzy xxx guifg=#00ffff

		-- CmpItemKindClass                               { fg="#20df6c", }, -- CmpItemKindClass xxx guifg=#20df6c
		-- CmpItemKindConstant                            { fg="#00ff66", }, -- CmpItemKindConstant xxx guifg=#00ff66
		-- CmpItemKindConstructor                         { fg="#00ffff", }, -- CmpItemKindConstructor xxx guifg=#00ffff
		-- CmpItemKindDefault                             { fg="#f5f5f5", }, -- CmpItemKindDefault xxx guifg=#f5f5f5
		-- CmpItemKindEnum                                { fg="#20df6c", }, -- CmpItemKindEnum xxx guifg=#20df6c
		-- CmpItemKindEnumMember                          { fg="#20df6c", }, -- CmpItemKindEnumMember xxx guifg=#20df6c
		-- CmpItemKindEvent                               { fg="#20df6c", }, -- CmpItemKindEvent xxx guifg=#20df6c
		-- CmpItemKindField                               { fg="#ffa600", }, -- CmpItemKindField xxx guifg=#ffa600
		-- CmpItemKindFunction                            { fg="#00ffff", }, -- CmpItemKindFunction xxx guifg=#00ffff
		-- CmpItemKindInterface                           { fg="#20df6c", }, -- CmpItemKindInterface xxx guifg=#20df6c
		-- CmpItemKindKeyword                             { fg="#007fff", }, -- CmpItemKindKeyword xxx guifg=#007fff
		-- CmpItemKindMethod                              { fg="#00ffff", }, -- CmpItemKindMethod xxx guifg=#00ffff
		-- CmpItemKindModule                              { fg="#f5f5f5", }, -- CmpItemKindModule xxx guifg=#f5f5f5
		-- CmpItemKindOperator                            { fg="#f5f5f5", }, -- CmpItemKindOperator xxx guifg=#f5f5f5
		-- CmpItemKindProperty                            { fg="#ffa600", }, -- CmpItemKindProperty xxx guifg=#ffa600
		-- CmpItemKindReference                           { fg="#ffa600", }, -- CmpItemKindReference xxx guifg=#ffa600
		-- CmpItemKindSnippet                             { fg="#e7dbdb", }, -- CmpItemKindSnippet xxx guifg=#e7dbdb
		-- CmpItemKindStruct                              { fg="#20df6c", }, -- CmpItemKindStruct xxx guifg=#20df6c
		-- CmpItemKindTypeParameter                       { fg="#20df6c", }, -- CmpItemKindTypeParameter xxx guifg=#20df6c
		-- CmpItemKindUnit                                { fg="#20df6c", }, -- CmpItemKindUnit xxx guifg=#20df6c
		-- CmpItemKindValue                               { fg="#00ff66", }, -- CmpItemKindValue xxx guifg=#00ff66
		-- CmpItemKindVariable                            { fg="#ffa600", }, -- CmpItemKindVariable xxx guifg=#ffa600
		-- CmpItemMenu                                    { fg="#e7dbdb", }, -- CmpItemMenu    xxx guifg=#e7dbdb
	}
end)
return blink
