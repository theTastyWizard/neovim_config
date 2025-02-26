-- autogenerated lush spec on þri  7.jan 2025, 20:48:01
-- Run :Lushify
-- then /Normal to find the Normal group and edit your fg & bg colors
local lush     = require("lush")
local hsl      = lush.hsl
local hsluv    = lush.hsluv

local grunn00  = hsl('#120f12')              -- 2 shade af pinky orig
local grunn01  = hsl('#1b181b')
local grunn02  = hsl('#2d2c2d')              --visual selected breytt til að sjá betur
local grunn03  = hsl('#117c3c')              --comments breytt til að sjá betur
local grunn04  = hsl('#e7dbdb')
local grunn05  = hsl('#f5f5f5')
local grunn06  = hsl('#ffffff')
local grunn07  = hsl('#f7f3f7')
local grunn08  = hsl('#ffa600')
local grunn09  = hsl('#00ff66')
local grunn0A  = hsl('#20df6c')
local grunn0B  = hsl('#ff0066')
local grunn0C  = hsl('#6600ff')
local grunn0D  = hsl('#00ffff')
local grunn0E  = hsl('#007fff')
local grunn0F  = hsl('#df206c')

local white    = hsl("#f5f5f5")
local bg_black = hsl('#120f12')
local bg_blue  = hsl("#050008")
local gray     = hsl('#2d2c2d') --visual selected breytt til að sjá betur

local purple   = hsl("#6600ff")
local teal     = hsl("#33abcc")
local magenta1 = hsl("#ff0066")
local magenta2 = hsl('#ad1f51')  --2tone
local magenta3 = hsl('#b62d65')
local red      = hsl(353, 100, 39)
local yellow   = hsl(36, 100, 50)
local green1   = hsl('#00ff66')
local green2   = hsl('#02d849')
local darkgreen = hsl('#117c3c')
local pink     = hsl("#ff5699")  -- complement af magenta
local orange   = hsl(18, 100, 50) 
local blue1    = hsl('#007fff') --hsl(210, 100, 50) 
local blue2    = hsl("#0066ff")
local cyan     = hsl('#00ffff')

-- help treesitter highlight groups
-- help  highlight groups

local theme    = lush(function(injected_functions)
	local sym = injected_functions.sym
	return {
		-- Colors
		White                                { fg = hsl("#f5f5f5") },
		Bg_black                             { fg = hsl('#120f12') },
		Bg_blue                              { fg = hsl("#050008") },
		Gray                                 { fg = hsl('#2d2c2d') }, --visual selected breytt til að sjá betur
		Purple                               { fg = hsl("#6600ff") },
		Teal                                 { fg = hsl("#33abcc") },
		Magenta1                             { fg = hsl("#ff0066") },
		Magenta2                             { fg = hsl('#ad1f51') }, --2tone
		Magenta3                             { fg = hsl('#b62d65') },
		Red                                  { fg = hsl(353, 100, 39) },
		Yellow                               { fg = hsl(36, 100, 50) },
		Green1                               { fg = hsl('#00ff66') },
		Green2                               { fg = hsl('#02d849') },
		Pink                                 { fg = hsl("#ff5699") }, -- complement af magenta
		Orange                               { fg = hsl(18, 100, 50) },
		Blue1                                { fg = hsl('#007fff') },
		Blue2                                { fg = hsl("#0066ff") },
		Cyan                                 { fg = hsl('#01ffff') },

		-- Native UI
		NormalNC                             { fg = "#f5f5f5", bg = "#120f12", }, 
		FloatermNC                           { NormalNC }, 
		NormalFloat                          { fg = "#f5f5f5", bg = bg_blue, }, 
		FloatermBorder                       { NormalFloat }, 
		FloatBorder                          { fg = "#f5f5f5", bg = "#120f12", }, 
		WinBar                               { fg = "#f5f5f5", }, 
		WinBarNC                             { fg = "#e7dbdb", }, 
		Cursor                               { fg = "#120f12", bg = "#f5f5f5", }, 
		CursorIM                             { Cursor }, 
		Underlined                           { fg = "#ffa600", }, 
		lCursor                              { fg = "bg", bg = "fg", }, 
		Substitute                           { fg = "#1b181b", bg = "#20df6c", }, 
		VisualNOS                            { fg = "#ffa600", }, 
		Normal                               { fg = "#f5f5f5", bg = "#120f12", }, 
		WinSeparator                         { Normal }, 
		Ignore                               { Normal }, 
		NvimSpacing                          { Normal }, 
		SpecialKey                           { fg = "#117c3c", }, 
		TermCursor                           { fg = "#120f12", bg = "#f5f5f5", }, 
		TermCursorNC                         { fg = "#120f12", bg = "#f5f5f5", }, 
		NonText                              { fg = "#117c3c", }, 
		EndOfBuffer                          { NonText }, 
		Whitespace                           { NonText }, 
		Directory                            { fg = teal, }, 
		ErrorMsg                             { fg = yellow, bg = "#120f12", }, 
		NvimInvalidSpacing                   { ErrorMsg }, 
		IncSearch                            { fg = "#1b181b", bg = "#00ff66", }, 
		MiniSurround                         { IncSearch }, 
		MiniOperatorsExchangeFrom            { IncSearch }, 
		Search                               { fg = "#1b181b", bg = "#20df6c", }, 
		CurSearch                            { fg = "nvimdarkgrey1", bg = "nvimlightyellow", }, 
		MoreMsg                              { fg = "#ff0066", }, 
		ModeMsg                              { fg = "#ff0066", }, 
		LineNr                               { fg = "#f5f5f5", bg = "#120f12" }, 
		LineNrAbove                          { fg = "#e7dbdb", bg = "#120f12" }, 
		LineNrBelow                          { fg = "#e7dbdb", bg = "#120f12" }, 
		CursorLineNr                         { fg = "#ffa600", bg = "#120f12", }, 
		Question                             { fg = "#00ffff", }, 
		StatusLine                           { fg = "#f5f5f5", bg = bg_blue, }, 
		MsgSeparator                         { StatusLine }, 
		StatusLineNC                         { StatusLine }, 
		VertSplit                            { fg = "#f5f5f5", bg = "#120f12", }, 
		Title                                { fg = orange, }, 
		FloatTitle                           { Title }, 
		Visual                               { bg = "#2d2c2d", }, 
		SnippetTabstop                       { Visual }, 
		WarningMsg                           { fg = yellow, }, 
		WildMenu                             { fg = "#ffa600", bg = "#20df6c", }, 
		Folded                               { fg = "#117c3c", bg = "#1b181b", }, 
		FoldColumn                           { fg = "#6600ff", bg = "#120f12", }, 
		CursorLineFold                       { FoldColumn }, 
		SignColumn                           { fg = "#e7dbdb", bg = "#120f12", }, 
		CursorLineSign                       { SignColumn }, 
		Conceal                              { fg = "#00ffff", bg = "#120f12", }, 
		SpellBad                             { gui = "undercurl", sp = "#ffa600", }, 
		SpellCap                             { gui = "undercurl", sp = "#00ffff", }, 
		SpellRare                            { gui = "undercurl", sp = "#007fff", }, 
		SpellLocal                           { gui = "undercurl", sp = "#6600ff", }, 
		Pmenu                                { fg = "#f5f5f5", bg = bg_blue, }, 
		PmenuKind                            { Pmenu }, 
		PmenuExtra                           { Pmenu }, 
		PmenuSbar                            { Pmenu }, 
		PmenuSel                             { fg = "#1b181b", bg = "#f5f5f5", }, 
		PmenuKindSel                         { PmenuSel }, 
		PmenuExtraSel                        { PmenuSel }, 
		PmenuThumb                           { bg = "nvimdarkgrey4", }, 
		TabLine                              { fg = "#117c3c", bg = "#1b181b", }, 
		TabLineSel                           { fg = "#ff0066", bg = "#1b181b", }, 
		TabLineFill                          { fg = "#117c3c", bg = "#1b181b", }, 
		CursorColumn                         { bg = "#1b181b", }, 
		CursorLine                           { bg = "#120f12", }, 
		ColorColumn                          { bg = "#1b181b", }, 
		QuickFixLine                         { bg = "#1b181b", }, 

		-- Native Syntax
		Character                            { fg = yellow }, 
		Constant                             { fg = "#00ff66", }, 
		sym "@enumMember"                    { Constant }, 
		Number                               { fg = "#00ff66", }, 
		NvimNumber                           { Number }, 
		Boolean                              { fg = "#00ff66", }, 
		Float                                { fg = "#00ff66", }, 
		Conditional                          { fg = "#007fff", }, 
		Statement                            { fg = yellow }, 
		Repeat                               { fg = "#20df6c", }, 
		Label                                { fg = "#20df6c", }, 
		Keyword                              { fg = "#007fff", }, 
		Exception                            { fg = yellow }, 
		Include                              { fg = "#00ffff", }, 
		PreProc                              { fg = "#20df6c", }, 
		PreCondit                            { PreProc }, 
		sym "@preproc"                       { PreProc }, 
		Define                               { fg = "#007fff", }, 
		sym "@define"                        { Define }, 
		Macro                                { fg = yellow }, 
		StorageClass                         { fg = "#20df6c", }, 
		sym "@storageclass"                  { StorageClass }, 
		Type                                 { fg = magenta2 }, 
		NvimNumberPrefix                     { Type }, 
		NvimOptionSigil                      { Type }, 
		sym "@typeParameter"                 { Type }, 
		Structure                            { fg = "#007fff", }, 
		sym "@interface"                     { Structure }, 
		Typedef                              { fg = "#20df6c", }, 
		Tag                                  { fg = "#20df6c", }, 
		Special                              { fg = "#6600ff", }, 
		SpecialComment                       { Special }, 
		sym "@variable.parameter.builtin"    { Special }, 
		sym "@module.builtin"                { Special }, 
		sym "@attribute.builtin"             { Special }, 
		sym "@markup"                        { Special }, 
		sym "@tag.builtin"                   { Special }, 
		DressingSelectIdx                    { Special }, 
		SpecialChar                          { fg = "#df206c", }, 
		sym "@string.special"                { SpecialChar }, 
		sym "@character.special"             { SpecialChar }, 
		NvimRegister                         { SpecialChar }, 
		NvimStringSpecial                    { SpecialChar }, 
		Debug                                { fg = yellow }, 
		sym "@debug"                         { Debug }, 
		Comment                              { fg = darkgreen }, 
		DiagnosticUnnecessary                { Comment }, 
		String                               { fg = "#ff0066", }, 
		NvimString                           { String }, 
		Identifier                           { fg = yellow }, 
		NvimIdentifier                       { Identifier }, 
		sym "@event"                         { Identifier }, 
		sym "@modifier"                      { Identifier }, 
		sym "@decorator"                     { Identifier }, 
		Function                             { fg = "#00ffff", }, 
		Operator                             { fg = "#007fff", }, 
		NvimAssignment                       { Operator }, 
		NvimOperator                         { Operator }, 
		Delimiter                            { fg = "#df206c", }, 
		sym "@punctuation"                   { Delimiter }, 
		NvimParenthesis                      { Delimiter }, 
		NvimColon                            { Delimiter }, 
		NvimComma                            { Delimiter }, 
		NvimArrow                            { Delimiter }, 
		Todo                                 { fg = "#20df6c"}, 

		sym "@markup.underline"              { gui = "underline", }, 
		DiagnosticDeprecated                 { gui = "strikethrough", sp = "nvimlightred", }, 
		FloatShadow                          { blend = 80, bg = "nvimdarkgrey4", }, 
		FloatShadowThrough                   { blend = 100, bg = "nvimdarkgrey4", }, 
		MatchParen                           { bg = "#117c3c", }, 

		Error                                { fg = red }, 
		NvimInvalid                          { Error }, 

		DiagnosticUnderlineError             { gui = "undercurl", sp = "#ffa600", }, 
		DiagnosticUnderlineWarn              { gui = "undercurl", sp = "#007fff", }, 
		DiagnosticUnderlineInfo              { gui = "underline", sp = "nvimlightcyan", }, 
		DiagnosticUnderlineHint              { gui = "undercurl", sp = "#6600ff", }, 
		DiagnosticUnderlineOk                { gui = "underline", sp = "nvimlightgreen", }, 

		NvimInternalError                    { fg = "#120f12", bg = yellow }, 
		NvimFigureBrace                      { NvimInternalError }, 
		NvimSingleQuotedUnknownEscape        { NvimInternalError }, 
		NvimInvalidSingleQuotedUnknownEscape { NvimInternalError }, 
		Bold                                 { gui = "bold", }, 
		Italic                               { gui = "italic", }, 
		sym "@markup.italic"                 { Italic }, 
		TooLong                              { fg = yellow }, 

		DiffAdd                              { fg = green2 }, 
		sym "@diff.plus"                     { DiffAdd }, 
		Added                                { DiffAdd}, 

		DiffChange                           { fg = magenta3 }, 
		sym "@diff.delta"                    { DiffChange }, 
		Changed                              {DiffChange}, 

		DiffDelete                           { fg = red }, 
		sym "@diff.minus"                    { DiffDelete }, 
		Removed                              {DiffDelete}, 


		DiffText                             { fg = yellow, bg = "#120f12", }, 

		GitGutterAdd                         { DiffAdd }, 
		GitGutterChange                      { DiffChange }, 
		GitGutterDelete                      { DiffDelete }, 
		GitGutterChangeDelete                { DiffText }, 

		DiagnosticError                      { fg = red }, 
		DiagnosticFloatingError              { DiagnosticError }, 
		DiagnosticVirtualTextError           { DiagnosticError }, 
		DiagnosticSignError                  { DiagnosticError }, 
		
		DiagnosticWarn                       { fg = yellow }, 
		DiagnosticFloatingWarn               { DiagnosticWarn }, 
		DiagnosticVirtualTextWarn            { DiagnosticWarn }, 
		DiagnosticSignWarn                   { DiagnosticWarn }, 
		DiagnosticInfo                       { fg = blue2 }, 
		DiagnosticFloatingInfo               { DiagnosticInfo }, 
		DiagnosticVirtualTextInfo            { DiagnosticInfo }, 
		DiagnosticSignInfo                   { DiagnosticInfo }, 
		DiagnosticHint                       { fg = pink }, 
		DiagnosticFloatingHint               { DiagnosticHint }, 
		DiagnosticVirtualTextHint            { DiagnosticHint }, 
		DiagnosticSignHint                   { DiagnosticHint }, 
		SnacksStatusColumnMark               { DiagnosticHint }, 
		DiagnosticOk                         { fg = green1 }, 
		DiagnosticFloatingOk                 { DiagnosticOk }, 
		DiagnosticVirtualTextOk              { DiagnosticOk }, 
		DiagnosticSignOk                     { DiagnosticOk }, 
		DiagnosticUnderlineWarning           { gui = "undercurl", sp = "#007fff", }, 
		DiagnosticUnderlineInformation       { gui = "undercurl", sp = "#df206c", }, 

		-- Treesitter Syntax
		TSAnnotation                         { fg = "#df206c", }, 
		TSAttribute                          { fg = "#20df6c", }, 
		sym "@attribute"                     { TSAttribute }, 
		sym "@tag.attribute"                 { TSAttribute }, 
		TSCharacter                          { Character }, 
		sym "@character"                     { TSCharacter }, 

		-- TSComment                            { Comment }, 
		sym "@comment"                       { Comment }, 
		sym "@comment.documentation"         { Comment }, 
		sym "@comment.todo"                  { Todo }, 
		sym "@comment.error"                 { DiagnosticError }, 
		sym "@comment.warning"               { DiagnosticWarn }, 
		sym "@comment.note"                  { DiagnosticInfo }, 
		sym "@comment.info"                  { DiagnosticInfo }, 
		sym "@comment.hint"                  { DiagnosticHint }, 

		TSConstructor                        { fg = "#00ffff", }, 
		sym "@constructor"                   { TSConstructor }, 
		TSConditional                        { fg = "#007fff", }, 
		sym "@conditional"                   { TSConditional }, 

		sym "@text"                          { fg = white }, 
		sym "@text.math"                     { Number }, 
		sym "@text.environment"              { Macro }, 
		sym "@text.environment.name"         { Type }, 
		sym "@text.note"                     { DiagnosticInfo }, 
		sym "@text.todo"                     { Todo }, 
		sym "@text.diff.add"                 { DiffAdd }, 
		sym "@text.diff.delete"              { DiffDelete }, 
		sym "@text.warning"                  { DiagnosticWarn }, 
		sym "@text.reference"                { fg = white }, 
		sym "@text.strong"                   { gui = "bold" }, 
		sym "@text.emphasis"                 { fg = green1,  gui = "italic", }, 
		sym "@text.underline"                { gui = "underline" }, 
		sym "@text.strike"                   { gui = "strikethrough" }, 
		sym "@text.title"                    { Title }, 
		sym "@text.literal"                  { fg = darkgreen }, 
		sym "@text.uri"                      { fg = green1, gui = "underline", }, 

		TSConstant                           { fg = "#00ff66", }, 
		sym "@constant"                      { TSConstant }, 
		sym "@constant.builtin"              { TSConstant }, 
		sym "@constant.macro"                { TSConstant }, 

		sym "@error"                         { Error }, 

		TSException                          { fg = "#ffa600", }, 
		sym "@exception"                     { TSException }, 
		TSField                              { fg = "#f5f5f5", }, 
		sym "@field"                         { TSField }, 
		-- sym "@float"                         { Float }, 

		TSFunction                           { Function }, 
		sym "@function"                      { TSFunction }, 
		sym "@function.call"                 { TSFunction }, 
		TSFuncBuiltin                        { fg = "#00ffff", gui = "italic", }, 
		sym "@function.builtin"              { TSFuncBuiltin }, 
		sym "@function.macro"                { Macro }, 
		sym "@function.method"               { fg = cyan }, 
		sym "@function.method.call"          { fg = cyan }, 

		TSInclude                            { fg = "#00ffff", }, 
		sym "@include"                       { TSInclude }, 
		TSKeyword                            { fg = "#007fff", }, 
		sym "@keyword"                       { TSKeyword }, 
		sym "@type.qualifier"                { TSKeyword }, 
		sym "@keyword.return"                { TSKeyword }, 
		TSKeywordFunction                    { fg = "#007fff", }, 
		sym "@keyword.function"              { TSKeywordFunction }, 
		TSKeywordOperator                    { fg = "#007fff", }, 
		sym "@keyword.operator"              { TSKeywordOperator }, 
		TSLabel                              { fg = "#20df6c", }, 
		sym "@label"                         { TSLabel }, 

		-- TSMethod                             { fg = "#00ffff", }, 
		-- sym "@method"                        { TSMethod }, 
		-- sym "@method.call"                   { TSMethod }, 

		TSNamespace                          { fg = yellow }, 
		sym "@namespace"                     { TSNamespace }, 
		TSNone                               { fg = "#f5f5f5", }, 
		sym "@none"                          { TSNone }, 

		sym "@boolean"                       { Boolean }, 
		sym "@number"                        { Number }, 
		sym "@number.float"                  { Number }, 

		TSOperator                           { fg = "#f5f5f5", }, 
		sym "@operator"                      { TSOperator }, 
		TSParameter                          { fg = "#f5f5f5", }, 
		sym "@parameter"                     { TSParameter }, 
		TSParameterReference                 { fg = "#f5f5f5", }, 
		TSProperty                           { fg = "#f5f5f5", },
		sym "@property"                      { TSProperty }, 
		TSPunctDelimiter                     { fg = "#df206c", }, 
		sym "@punctuation.delimiter"         { TSPunctDelimiter }, 
		TSPunctBracket                       { fg = "#f5f5f5", }, 
		sym "@punctuation.bracket"           { TSPunctBracket }, 
		TSPunctSpecial                       { fg = "#df206c", }, 
		sym "@punctuation.special"           { TSPunctSpecial }, 
		TSRepeat                             { fg = "#007fff", }, 
		sym "@repeat"                        { TSRepeat }, 

		TSString                             { fg = "#ff0066", }, 
		sym "@string"                        { TSString }, 
		TSStringRegex                        { fg = "#6600ff", }, 
		sym "@string.regex"                  { TSStringRegex }, 
		sym "@regexp"                        { TSStringRegex }, 
		TSStringEscape                       { fg = "#6600ff", }, 
		sym "@string.escape"                 { TSStringEscape }, 
		TSSymbol                             { fg = "#ff0066", }, 
		sym "@symbol"                        { TSSymbol }, 
		TSTag                                { fg = yellow }, 
		sym "@tag"                           { TSTag }, 
		TSTagDelimiter                       { fg = "#df206c", }, 
		sym "@tag.delimiter"                 { TSTagDelimiter }, 
		TSText                               { fg = "#f5f5f5", }, 
		TSStrong                             { gui = "bold", }, 
		TSEmphasis                           { fg = "#00ff66", gui = "italic", }, 
		TSUnderline                          { fg = "#120f12", gui = "underline", }, 
		TSStrike                             { fg = "#120f12", gui = "strikethrough", }, 
		TSTitle                              { fg = "#00ffff", }, 
		TSLiteral                            { fg = "#00ff66", }, 
		TSURI                                { fg = "#00ff66", gui = "underline", }, 
		TSType                               { fg = "#20df6c", }, 
		sym "@type"                          { TSType }, 
		sym "@type.definition"               { TSType }, 
		sym "@class"                         { TSType }, 
		sym "@struct"                        { TSType }, 
		sym "@enum"                          { TSType }, 
		TSTypeBuiltin                        { fg = "#20df6c", gui = "italic", }, 
		sym "@type.builtin"                  { TSTypeBuiltin }, 

		TSVariable                           { fg = yellow }, 
		sym "@variable"                      { TSVariable }, 
		TSVariableBuiltin                    { fg = yellow, gui = "italic", }, 
		sym "@variable.builtin"              { TSVariableBuiltin }, 

		TSDefinition                         { gui = "underline", sp = "#e7dbdb", }, 
		TSDefinitionUsage                    { gui = "underline", sp = "#e7dbdb", }, 
		TSCurrentScope                       { gui = "bold", }, 
		TreesitterContext                    { gui = "italic", bg = "#1b181b", }, 

		rainbowcol1                          { fg = "#ffffff", }, 
		rainbowcol2                          { fg = "#00ff66", }, 
		rainbowcol3                          { fg = "#20df6c", }, 
		rainbowcol4                          { fg = "#f7f3f7", }, 
		rainbowcol5                          { fg = "#6600ff", }, 
		rainbowcol6                          { fg = "#00ffff", }, 
		rainbowcol7                          { fg = "#007fff", }, 
		User1                                { fg = "#ffa600", bg = "#2d2c2d", }, 
		User2                                { fg = "#007fff", bg = "#2d2c2d", }, 
		User3                                { fg = "#f5f5f5", bg = "#2d2c2d", }, 
		User4                                { fg = "#6600ff", bg = "#2d2c2d", }, 
		User5                                { fg = "#f5f5f5", bg = "#2d2c2d", }, 
		User6                                { fg = "#f5f5f5", bg = "#1b181b", }, 
		User7                                { fg = "#f5f5f5", bg = "#2d2c2d", }, 
		User8                                { fg = "#120f12", bg = "#2d2c2d", }, 
		User9                                { fg = "#120f12", bg = "#2d2c2d", }, 

		-- lsp-highlight
		-- Lsp help 
		LspCodeLens                          { NonText }, 
		LspSignatureActiveParameter          { Visual }, 
		LspInlayHint                         { fg = "#117c3c", gui = "italic", }, 
		LspReferenceRead                     { gui = "underline", sp = "#e7dbdb", }, 
		LspReferenceText                     { gui = "underline", sp = "#e7dbdb", }, 
		LspReferenceWrite                    { gui = "underline", sp = "#e7dbdb", }, 
		LspDiagnosticsDefaultError           { DiagnosticError }, 
		LspDiagnosticsDefaultWarning         { DiagnosticWarn }, 
		LspDiagnosticsDefaultInformation     { DiagnosticInfo }, 
		LspDiagnosticsDefaultHint            { DiagnosticHint }, 
		sym "@lsp.mod.deprecated"            { DiagnosticDeprecated }, 
		LspDiagnosticsUnderlineError         { DiagnosticUnderlineError }, 
		LspDiagnosticsUnderlineHint          { DiagnosticUnderlineHint }, 
		LspDiagnosticsUnderlineWarning       { DiagnosticUnderlineWarning }, 
		LspDiagnosticsUnderlineInformation   { DiagnosticUnderlineInformation }, 
	}
end)
return theme
