-- Built with,

--        ,gggg,
--       d8" "8I                         ,dPYb,
--       88  ,dP                         IP'`Yb
--    8888888P"                          I8  8I
--       88                              I8  8'
--       88        gg      gg    ,g,     I8 dPgg,
--  ,aa,_88        I8      8I   ,8'8,    I8dP" "8I
-- dP" "88P        I8,    ,8I  ,8'  Yb   I8P    I8
-- Yb,_,d88b,,_   ,d8b,  ,d8b,,8'_   8) ,d8     I8,
--  "Y8P"  "Y888888P'"Y88P"`Y8P' "YY8P8P88P     `Y8
--

-- This is a starter colorscheme for use with Lush,
-- for usage guides, see :h lush or :LushRunTutorial

--
-- Note: Because this is a lua file, vim will append it to the runtime,
--       which means you can require(...) it in other lua code (this is useful),
--       but you should also take care not to conflict with other libraries.
--
--       (This is a lua quirk, as it has somewhat poor support for namespacing.)
--
--       Basically, name your file,
--
--       "super_theme/lua/lush_theme/super_theme_dark.lua",
--
--       not,
--
--       "super_theme/lua/dark.lua".
--
--       With that caveat out of the way...
--

-- Enable lush.ify on this file, run:
--
--  `:Lushify`
--
--  or
--
--  `:lua require('lush').ify()`

local lush                  = require('lush')
local hsl                   = lush.hsl


-- cyan = "#36d0e0",
-- blue = ,
-- magenta = "#c678dd",


local grunn00               = hsl('#120f12') -- 2 shade af pinky orig
local grunn01               = hsl('#1b181b')
local grunn02               = hsl('#2d2c2d') --visual selected breytt til að sjá betur
local grunn03               = hsl('#117c3c') --comments breytt til að sjá betur
local grunn04               = hsl('#e7dbdb')
local grunn05               = hsl('#f5f5f5')
local grunn06               = hsl('#ffffff')
local grunn07               = hsl('#f7f3f7')
local grunn08               = hsl('#ffa600')
local grunn09               = hsl('#00ff66')
local grunn0A               = hsl('#20df6c')
local grunn0B               = hsl('#ff0066')
local grunn0C               = hsl('#6600ff')
local grunn0D               = hsl('#00ffff')
local grunn0E               = hsl('#007fff')
local grunn0F               = hsl('#df206c')

-- local bg_black      = hsl('#120f12')
local bg_black              = hsl(300, 9.09, 6.47)
local bg_black_blue         = hsl("#050008")
local bg_blar               = hsl("#010b10")
local blar_bakgrunnur       = hsl("#1e223c")
local ljos_bakgrunnur       = bg_black.lighten(12)

local bakgrunnur_dokkblar_1 = hsl("#16172d")
local bakgrunnur_dokkblar_2 = hsl("#1b1c36")

-- local framgrunnur     = hsl('#f5f5f5')
local white                 = hsl(0, 0, 96.08) --TODO: Skoða betur


local blue_mag    = hsl("#0066ff")
local blue        = hsl(210, 100, 50)
local blue2       = hsl("#149bda")  --unikitty
local blue3		  = hsl("#61afef")

-- local cyan         = hsl('#00ffff')
-- local cyan         = hsl('#00efff')
local cyan        = hsl(180, 100, 60)

local green1      = hsl('#00ff66') --Notað fyrir tölur,const,boolean í upprunalega
local green2      = hsl('#20df6c')
local green3      = hsl('#1dd361')
local green4      = hsl('#02d849')
local green5      = hsl('#169c4b')

local darkgreen   = hsl('#117c3c')
local darkergreen = darkgreen.darken(15) -- fyrir comment

local pink1       = hsl('#cd6689')
local pink2       = hsl('#ff757f')
local pink3       = hsl('#fca7ea')
local pink_dark   = hsl('#843c54')

local pink4       = hsl("#ff5699") -- complement af magenta
local pink5       = hsl("#ce6f8f") -- space ducks
local pink6       = hsl("#ed655e") -- 2tone pool
local pink7		  = hsl("#d16d9e")

-- local magenta         = hsl('#ff0066')
local magenta     = hsl(336, 100, 50)
local magenta2    = hsl("#df206c")
local magenta3    = hsl('#b62d65')
local magenta3    = hsl('#ad1f51') --2tone

local orange      = hsl(18, 100, 50)
local orange2     = hsl("#ff6600")
local orange3	  = hsl("#d65407")
local orange4	  = hsl("#FF8700")

-- local purple       = hsl('#6600ff')
local purple      = hsl(264, 100, 50)
local purple2     = hsl('#4961da')
local purple3     = hsl('#8f51e6')
local purple4     = hsl("#512c74")
local purple5     = hsl("#796af5") --unikitty

-- local red             = hsl('#ca0019')
local red         = hsl(353, 100, 39)
local red2        = hsl("#df202c") --complement fyrir magenta2
local red3        = hsl("#e43728") -- úr zitchdog-pine
local red3        = hsl("#cf504a") -- úr zitchdog-pine
local red4		  = hsl("#e95678")


local teal1       = hsl('#21c992')
local teal2       = hsl('#4fd6be')
local teal3       = hsl('#41a6b5')
local teal4       = hsl('#38a89d') -- úr tokyodark
local teal5       = hsl('#289dbd')
local teal6       = hsl('#33abcc')
local teal7       = hsl('#17ad98')   --unikitty
local teal8		  = hsl("#1abc9c")

local yellow_fg = hsl("#f7bb3b")
local yellow      = hsl(36, 100, 50) --('#ffa600(',

-- LSP/Linters mistakenly show `undefined global` errors in the spec, they may
-- support an annotation like the following. Consult your server documentation.
---@diagnostic disable: undefined-global
local theme       = lush(function(injected_functions)
	local sym = injected_functions.sym
	return {
		-- The following are the Neovim (as of 0.8.0-dev+100-g371dfb174) highlight
		-- groups, mostly used for styling UI elements.
		-- Comment them out and add your own properties to override the defaults.
		-- An empty definition `{}` will clear all styling, leaving elements looking
		-- like the 'Normal' group.
		-- To be able to link to a group, it must already be defined, so you may have
		-- to reorder items as you go.
		--
		-- See :h highlight-groups
		--
		Normal { bg = bg_black, fg = white },     -- Normal text
		NormalFloat { bg = bg_black_blue, fg = white }, -- Normal text in floating windows.
		-- ColorColumn    { }, -- Columns set with 'colorcolumn'
		-- Conceal        { }, -- Placeholder characters substituted for concealed text (see 'conceallevel')
		-- Cursor         { }, -- Character under the cursor
		-- CurSearch      { }, -- Highlighting a search pattern under the cursor (see 'hlsearch')
		-- lCursor        { }, -- Character under the cursor when |language-mapping| is used (see 'guicursor')
		-- CursorIM       { }, -- Like Cursor, but used when in IME mode |CursorIM|
		-- CursorColumn   { }, -- Screen-column at the cursor, when 'cursorcolumn' is set.
		CursorLine { bg = Normal.bg }, -- Screen-line at the cursor, when 'cursorline' is set. Low-priority if foreground (ctermfg OR guifg) is not set.
		Directory { fg = teal6 }, -- Directory names (and other special names in listings)
		DiffAdd        { fg = green2 }, -- Diff mode: Added line |diff.txt|
		DiffChange     { fg = yellow}, -- Diff mode: Changed line |diff.txt|
		DiffDelete { fg = red },          -- Diff mode: Deleted line |diff.txt|
		-- DiffText       { }, -- Diff mode: Changed text within a changed line |diff.txt|
		EndOfBuffer { fg = blar_bakgrunnur }, -- Filler lines (~) after the end of the buffer. By default, this is highlighted like |hl-NonText|.
		TermCursor { bg = bg_black, fg = white }, -- Cursor in a focused terminal
		TermCursorNC { TermCursor },        -- Cursor in an unfocused terminal
		ErrorMsg { fg = red },              -- Error messages on the command line
		VertSplit { Normal },               -- Column separating vertically split windows
		-- Folded         { }, -- Line used for closed folds
		-- FoldColumn     { }, -- 'foldcolumn'
		-- SignColumn     { }, -- Column where |signs| are displayed
		-- IncSearch      { }, -- 'incsearch' highlighting; also used for the text replaced with ":s///c"
		-- Substitute     { }, -- |:substitute| replacement text highlighting
		LineNr { fg = white },           -- Line number for ":number" and ":#" commands, and when 'number' or 'relativenumber' option is set.
		LineNrAbove { fg = white.darken(55) }, -- Line number for when the 'relativenumber' option is set, above the cursor line
		LineNrBelow { fg = white.darken(55) }, -- Line number for when the 'relativenumber' option is set, below the cursor line
		CursorLineNr { fg = white },     -- Like LineNr when 'cursorline' or 'relativenumber' is set for the cursor line.
		-- CursorLineFold { }, -- Like FoldColumn when 'cursorline' is set for the cursor line
		-- CursorLineSign { }, -- Like SignColumn when 'cursorline' is set for the cursor line
		-- MatchParen     { }, -- Character under the cursor or just before it, if it is a paired bracket, and its match. |pi_paren.txt|
		-- ModeMsg        { }, -- 'showmode' message (e.g., "-- INSERT -- ")
		-- MsgArea        { }, -- Area for messages and cmdline
		-- MsgSeparator   { }, -- Separator for scrolled messages, `msgsep` flag of 'display'
		-- MoreMsg        { }, -- |more-prompt|
		-- NonText        { }, -- '@' at the end of the window, characters from 'showbreak' and other characters that do not really exist in the text (e.g., ">" displayed when a double-wide character doesn't fit at the end of the line). See also |hl-EndOfBuffer|.
		FloatBorder { Normal }, -- Border of floating windows.
		FloatTitle { fg = orange2 }, -- Title of floating windows.
		-- NormalNC       { }, -- normal text in non-current windows
		-- Pmenu          { }, -- Popup menu: Normal item.
		-- PmenuSel       { }, -- Popup menu: Selected item.
		-- PmenuKind      { }, -- Popup menu: Normal item "kind"
		-- PmenuKindSel   { }, -- Popup menu: Selected item "kind"
		-- PmenuExtra     { }, -- Popup menu: Normal item "extra text"
		-- PmenuExtraSel  { }, -- Popup menu: Selected item "extra text"
		-- PmenuSbar      { }, -- Popup menu: Scrollbar.
		-- PmenuThumb     { }, -- Popup menu: Thumb of the scrollbar.
		-- Question       { }, -- |hit-enter| prompt and yes/no questions
		-- QuickFixLine   { }, -- Current |quickfix| item in the quickfix window. Combined with |hl-CursorLine| when the cursor is there.
		-- Search         { }, -- Last search pattern highlighting (see 'hlsearch'). Also used for similar items that need to stand out.
		-- SpecialKey     { }, -- Unprintable characters: text displayed differently from what it really is. But not 'listchars' whitespace. |hl-Whitespace|
		SpellBad { gui = 'undercurl', sp = red2 }, -- Word that is not recognized by the spellchecker. |spell| Combined with the highlighting used otherwise.
		SpellCap       { gui = 'undercurl', sp = yellow  }, -- Word that should start with a capital. |spell| Combined with the highlighting used otherwise.
		-- SpellLocal     { }, -- Word that is recognized by the spellchecker as one that is used in another region. |spell| Combined with the highlighting used otherwise.
		-- SpellRare      { }, -- Word that is recognized by the spellchecker as one that is hardly ever used. |spell| Combined with the highlighting used otherwise.
		StatusLine { bg = bg_black_blue }, -- Status line of current window
		StatusLineNC { StatusLine }, -- Status lines of not-current windows. Note: If this is equal to "StatusLine" Vim will use "^^^" in the status line of the current window.
		-- TabLine        { bg = bjartur_framgrunnur }, -- Tab pages line, not active tab page label
		-- TabLineFill    { }, -- Tab pages line, where there are no labels
		-- TabLineSel     { }, -- Tab pages line, active tab page label
		-- Title          { }, -- Titles for output from ":set all", ":autocmd" etc.
		Visual { bg = ljos_bakgrunnur }, -- Visual mode selection
		-- VisualNOS      { }, -- Visual mode selection when vim is "Not Owning the Selection".
		WarningMsg { fg = yellow }, -- Warning messages
		-- Whitespace     { }, -- "nbsp", "space", "tab" and "trail" in 'listchars'
		Winseparator { Normal },   -- Separator between window splits. Inherts from |hl-VertSplit| by default, which it will replace eventually.
		-- WildMenu       { }, -- Current match in 'wildmenu' completion
		-- WinBar         { }, -- Window bar of current window
		-- WinBarNC       { }, -- Window bar of not-current windows

		-- Common vim syntax groups used for all kinds of code and markup.
		-- Commented-out groups should chain up to their preferred (*) group
		-- by default.
		--
		-- See :h group-name
		--
		-- Uncomment and edit if you want more specific syntax highlighting.

		Comment { fg = darkergreen }, -- Any comment

		-- Constant       { fg = red }, -- (*) Any constant
		String { fg = magenta }, --   A string constant: "this is a string"
		Character { fg = teal5 }, --   A character constant: 'c', '\n'
		Number { fg = green1 }, --   A number constant: 234, 0xff
		Boolean { fg = green1 }, --   A boolean constant: TRUE, false
		Float { fg = green1 }, --   A floating point constant: 2.3e10

		Identifier { fg = red4 }, -- (*) Any variable name
		Function { fg = orange2 }, --   Function name (also: methods for classes)
		-- Function { fg = pink4 }, --   Function name (also: methods for classes)

		Statement { fg = blue_mag }, -- (*) Any statement
		Conditional { fg = blue_mag }, --   if, then, else, endif, switch, etc.
		Repeat { fg = blue_mag },    --   for, do, while, etc.
		Label { fg = purple3 },      --   case, default, etc.
		Operator { fg = red3  },     --   "sizeof", "+", "*", etc. --TODO: velja annað
		-- Operator { fg = green4  },     --   "sizeof", "+", "*", etc. --TODO: velja annað
		Keyword { fg = blue_mag },    --   any other keyword
		Exception { fg = yellow },   --   try, catch, throw

		PreProc        { fg = yellow }, -- (*) Generic Preprocessor
		Include        { fg = yellow }, --   Preprocessor #include
		Define         { fg = yellow }, --   Preprocessor #define
		Macro          { fg = yellow }, --   Same as Define
		PreCondit      { fg = yellow }, --   Preprocessor #if, #else, #endif, etc.

		Type           { fg = magenta3 }, -- (*) int, long, char, etc.
		StorageClass   { fg =purple }, --   static, register, volatile, etc.
		Structure      {  fg =purple }, --   struct, union, enum, etc.
		Typedef        {  fg =purple }, --   A typedef

		Special        { fg = darkergreen }, -- (*) Any special symbol
		SpecialChar    { fg = magenta2 }, --   Special character in a constant
		Tag            { fg = green1 }, --   You can use CTRL-] on this
		Delimiter      { fg = magenta3 }, --   Character that needs attention
		SpecialComment { fg = purple }, --   Special things inside a comment (e.g. '\n')
		-- Debug          { fg = blue}, --   Debugging statements

		Underlined { gui = "underline" }, -- Text that stands out, HTML links
		-- Ignore         { }, -- Left blank, hidden |hl-Ignore| (NOTE: May be invisible here in template)
		-- Error          { }, -- Any erroneous construct
		-- Todo           { }, -- Anything that needs extra attention; mostly the keywords TODO FIXME and XXX

		-- These groups are for the native LSP client and diagnostic system. Some
		-- other LSP clients may use these groups, or use their own. Consult your
		-- LSP client's documentation.

		-- See :h lsp-highlight, some groups may not be listed, submit a PR fix to lush-template!
		--
		-- LspReferenceText            { } , -- Used for highlighting "text" references
		-- LspReferenceRead            { } , -- Used for highlighting "read" references
		-- LspReferenceWrite           { } , -- Used for highlighting "write" references
		-- LspCodeLens                 { } , -- Used to color the virtual text of the codelens. See |nvim_buf_set_extmark()|.
		-- LspCodeLensSeparator        { } , -- Used to color the seperator between two or more code lens.
		-- LspSignatureActiveParameter { } , -- Used to highlight the active parameter in the signature help. See |vim.lsp.handlers.signature_help()|.

		-- See :h diagnostic-highlights, some groups may not be listed, submit a PR fix to lush-template!
		--
		DiagnosticError { fg = red }, -- Used as the base highlight group. Other Diagnostic highlights link to this by default (except Underline)
		DiagnosticWarn { fg = yellow }, -- Used as the base highlight group. Other Diagnostic highlights link to this by default (except Underline)
		DiagnosticInfo { fg = blue_mag }, --TODO:Breyta í flottari lit Used as the base highlight group. Other Diagnostic highlights link to this by default (except Underline)
		DiagnosticHint { fg = pink4 }, --TODO:Breyta Used as the base highlight group. Other Diagnostic highlights link to this by default (except Underline)
		DiagnosticOk { fg = green1 }, -- Used as the base highlight group. Other Diagnostic highlights link to this by default (except Underline)
		-- DiagnosticVirtualTextError { } , -- Used for "Error" diagnostic virtual text.
		-- DiagnosticVirtualTextWarn  { } , -- Used for "Warn" diagnostic virtual text.
		-- DiagnosticVirtualTextInfo  { } , -- Used for "Info" diagnostic virtual text.
		-- DiagnosticVirtualTextHint  { } , -- Used for "Hint" diagnostic virtual text.
		-- DiagnosticVirtualTextOk    { } , -- Used for "Ok" diagnostic virtual text.
		-- DiagnosticUnderlineError   { } , -- Used to underline "Error" diagnostics.
		-- DiagnosticUnderlineWarn    { } , -- Used to underline "Warn" diagnostics.
		-- DiagnosticUnderlineInfo    { } , -- Used to underline "Info" diagnostics.
		-- DiagnosticUnderlineHint    { } , -- Used to underline "Hint" diagnostics.
		-- DiagnosticUnderlineOk      { } , -- Used to underline "Ok" diagnostics.
		-- DiagnosticFloatingError    { } , -- Used to color "Error" diagnostic messages in diagnostics float. See |vim.diagnostic.open_float()|
		-- DiagnosticFloatingWarn     { } , -- Used to color "Warn" diagnostic messages in diagnostics float.
		-- DiagnosticFloatingInfo     { } , -- Used to color "Info" diagnostic messages in diagnostics float.
		-- DiagnosticFloatingHint     { } , -- Used to color "Hint" diagnostic messages in diagnostics float.
		-- DiagnosticFloatingOk       { } , -- Used to color "Ok" diagnostic messages in diagnostics float.
		-- DiagnosticSignError        { } , -- Used for "Error" signs in sign column.
		-- DiagnosticSignWarn         { } , -- Used for "Warn" signs in sign column.
		-- DiagnosticSignInfo         { } , -- Used for "Info" signs in sign column.
		-- DiagnosticSignHint         { } , -- Used for "Hint" signs in sign column.
		-- DiagnosticSignOk           { } , -- Used for "Ok" signs in sign column.

		-- Tree-Sitter syntax groups.
		--
		-- See :h treesitter-highlight-groups, some groups may not be listed,
		-- submit a PR fix to lush-template!
		--
		-- Tree-Sitter groups are defined with an "@" symbol, which must be
		-- specially handled to be valid lua code, we do this via the special
		-- sym function. The following are all valid ways to call the sym function,
		-- for more details see https://www.lua.org/pil/5.html
		--
		-- sym("@text.literal")
		-- sym('@text.literal')
		-- sym"@text.literal"
		-- sym'@text.literal'
		--
		-- For more information see https://github.com/rktjmp/lush.nvim/issues/109

		-- sym "@text.literal" { Comment }, -- Comment
		-- sym"@text.reference"    { }, -- Identifier
		-- sym"@text.title"        { }, -- Title
		-- sym"@text.uri"          { }, -- Underlined
		-- sym"@text.underline"    { }, -- Underlined
		-- sym"@text.todo"         { }, -- Todo
		sym "@comment" { Comment }, -- Comment
		-- sym"@punctuation"       { }, -- Delimiter
		-- sym"@constant"          { }, -- Constant
		-- sym"@constant.builtin"  { }, -- Special
		-- sym"@constant.macro"    { }, -- Define
		-- sym"@define"            { }, -- Define
		-- sym"@macro"             { }, -- Macro
		-- sym"@string"            { }, -- String
		-- sym"@string.escape"     { }, -- SpecialChar
		-- sym"@string.special"    { }, -- SpecialChar
		-- sym"@character"         { }, -- Character
		-- sym"@character.special" { }, -- SpecialChar
		-- sym "@number" { Number },	-- Number
		-- sym"@boolean"           { }, -- Boolean
		-- sym "@float" { Float },		-- Float
		-- sym"@function"          { }, -- Function
		-- sym"@function.builtin"  { fg = yellow}, -- Special
		-- sym"@function.macro"    { }, -- Macro
		-- sym"@parameter"         { }, -- Identifier
		-- sym"@method"            { }, -- Function
		-- sym"@field"             { fg = pink2 }, -- Identifier
		-- sym"@property"          { }, -- Identifier
		-- sym"@constructor"       { }, -- Special
		-- sym"@conditional"       { }, -- Conditional
		-- sym"@repeat"            { Repeat}, -- Repeat
		-- sym"@label"             { }, -- Label
		-- sym"@operator"          { }, -- Operator
		-- sym"@keyword"           { fg = yellow }, -- Keyword
		-- sym"@exception"         { }, -- Exception
		-- sym"@variable"          { }, -- Identifier
		-- sym"@type"              { }, -- Type
		-- sym"@type.definition"   { }, -- Typedef
		-- sym"@storageclass"      { }, -- StorageClass
		-- sym"@structure"         { }, -- Structure
		-- sym"@namespace"         { fg = pink4 }, -- Identifier
		-- sym"@include"           { Include}, -- Include
		-- sym"@preproc"           { }, -- PreProc
		-- sym"@debug"             { }, -- Debug
		-- sym"@tag"               { }, -- Tag

		-- Mín viðbót
		NormalMode { fg = teal8 },
		InsertMode { fg = magenta },
		VisualMode { fg = green2 },

	}
end)

-- Return our parsed theme for extension or use elsewhere.
return theme

-- vi:nowrap
