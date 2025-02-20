local lush = require("lush")
local hsl = lush.hsl
local hsluv = lush.hsluv

local adal = require('lush_theme.Minky')
local modicator = require('lush_theme.plugins.modicator')
local blink = require('lush_theme.plugins.blink')
local mini_icons = require('lush_theme.plugins.mini_icons')
local which_key = require('lush_theme.plugins.which_key')

local specs = {
	adal,
	modicator,
	mini_icons,
	blink,
	which_key,
}

local spec = lush.merge(specs)

return spec
