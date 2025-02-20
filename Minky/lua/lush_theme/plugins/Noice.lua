local lush = require("lush")
local hsl = lush.hsl
local hsluv = lush.hsluv

local Minky = require('lush_theme.Minky')

local theme = lush(function(injected_functions)
	local sym = injected_functions.sym
	return {
		-- NoiceSplit { NormalFloat },                                              -- NoiceSplit
		-- NoicePopup { NormalFloat },                                              -- NoicePopup
		-- NoiceSplitBorder { FloatBorder },                                        -- NoiceSplitBorder
		-- NoicePopupmenuBorder { FloatBorder },                                    -- NoicePopupmenuBorder
		-- NoicePopupBorder { FloatBorder },                                        -- NoicePopupBorder
		-- NoiceCursor { Cursor },                                                  -- NoiceCursor
		-- NoiceConfirm { Normal },                                                 -- NoiceConfirm
		-- NoiceCmdlinePopup { Normal },                                            -- NoiceCmdlinePopup
		-- NoiceFormatLevelOff { NonText },                                         -- NoiceFormatLevelOff
		-- NoiceFormatLevelTrace { NonText },                                       -- NoiceFormatLevelTrace
		-- NoiceFormatLevelDebug { NonText },                                       -- NoiceFormatLevelDebug
		-- NoiceFormatKind { NonText },                                             -- NoiceFormatKind
		-- NoiceFormatEvent { NonText },                                            -- NoiceFormatEvent
		-- NoiceLspProgressTitle { NonText },                                       -- NoiceLspProgressTitle
		-- NoiceLspProgressClient { Title },                                        -- NoiceLspProgressClient
		-- NoiceFormatTitle { Title },                                              -- NoiceFormatTitle
		-- NoiceCmdlinePrompt { Title },                                            -- NoiceCmdlinePrompt
		-- NoiceFormatConfirmDefault { Visual },                                    -- NoiceFormatConfirmDefault
		-- NoicePopupmenu { Pmenu },                                                -- NoicePopupmenu
		-- NoicePopupmenuSelected { PmenuSel },                                     -- NoicePopupmenuSelected
		-- NoiceScrollbarThumb { PmenuThumb },                                      -- NoiceScrollbarThumb
		-- NoiceFormatConfirm { CursorLine },                                       -- NoiceFormatConfirm
		-- NoiceFormatProgressTodo { CursorLine },                                  -- NoiceFormatProgressTodo
		-- NoiceLspProgressSpinner { Constant },                                    -- NoiceLspProgressSpinner
		-- NoiceCompletionItemKindDefault { Special },                              -- NoiceCompletionItemKindDefault
		-- NoiceFormatDate { Special },                                             -- NoiceFormatDate
		-- NoicePopupmenuMatch { Special },                                         -- NoicePopupmenuMatch
		-- NoiceFormatProgressDone { fg = "#1b181b", bg = "#20df6c", },             -- NoiceFormatProgressDone
		-- NoiceHiddenCursor { gui = "nocombine", blend = 100, },                   -- NoiceHiddenCursor
	}
end)
return theme
