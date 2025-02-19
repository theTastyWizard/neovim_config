local lush = require("lush")
local hsl = lush.hsl
local hsluv = lush.hsluv

local Adal = require('lush_theme.Minky')
local Modicator = require('lush_theme.plugins.modicator')

local specs = {
	Adal,
	Modicator,
}

local spec = lush.merge(specs)

return spec
