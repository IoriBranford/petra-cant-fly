local Config = {}
local pl_pretty = require "pl.pretty"

local filename = "config.lua"

local defaults = {
	_version = 1,
	drawbodies = false,
	drawstats = false,
	exclusive = false,
	exhibit = false,
	rotation = 0,
	fullscreen = true,
	vsync = true,
	usedpiscale = false,
	basewindowwidth = 640,
	basewindowheight = 360,
	canvasresolution = "HIGH",
	canvasscaleint = true,
	canvasscalesoft = false,
	musicvolume = 0.5,
	soundvolume = 0.5,
	resizable = false,

	key_left = "left",
	key_right = "right",
	key_up = "up",
	key_down = "down",
	key_fire = "z",
	key_focus = "x",
	key_bomb = "c",
	key_pause = "pause",
	key_pausemenu = "escape",
	key_restart = "none",

	game_difficulty = "NORMAL",
	game_dialogue = true,
	player_character = "Amy",
	player_hitbox = "FOCUSFIRE",
	player_burst = 4,
	practice_lives = 2,
	practice_bombs = 1,
	practice_wingmen = 0,
	practice_powerlevel = 0,
	practice_stage = "DEMONREALM",

	joy_deadzone = 0.25,
	joy_move1 = "left",
	joy_move2 = "dp",
	joy_startbackrestart = false,
	joy_fire = "x",
	joy_focus = "a",
	joy_bomb = "b",
	joy_pause = "back",
	joy_pausemenu = "start",
	joy_namingscheme = "XBOX",

	hud_inner = "AUTO",
	hud_outer = true,

	backgroundstyle = "ART2",
	highscores_difficulty = "NORMAL",
	highscores_character = "Amy",
	highscores_onlineposition = "TOP",
}

local config = {}

function Config.reset()
	for k,v in pairs(defaults) do
		config[k] = v
	end
end
Config.reset()

function Config.load()
	if love.filesystem.getInfo(filename) then
		local fileconfig = love.filesystem.load(filename)()
		for k,v in pairs(fileconfig) do
			Config[k] = v
		end
	end
end

function Config.save()
	local configtext = "return "..pl_pretty.write(config)
	love.filesystem.write(filename, configtext)
end

function Config.isPortraitRotation()
	local rotation = math.rad(Config.rotation)
	return math.abs(math.sin(rotation)) > math.sqrt(2)/2
end

function Config.isPortraitDimensions()
	local w, h, flags = love.window.getMode()
	return w < h
end

function Config.applyDisplayMode()
	local w, h, flags = love.window.getMode()
	local modes = love.window.getFullscreenModes()
	local exclusive = Config.exclusive
	local fullscreen = Config.fullscreen
	local basew, baseh
	if Config.isPortraitRotation() then
		basew = Config.basewindowheight
		baseh = Config.basewindowwidth
	else
		basew = Config.basewindowwidth
		baseh = Config.basewindowheight
	end
	local bestmode
	local maxscale = 1

	if fullscreen and exclusive then
		for i = 1, #modes do
			local mode = modes[i]
			if not bestmode
			or bestmode.width > mode.width
			or bestmode.height > mode.height
			then
				if mode.height >= baseh and mode.width >= basew then
					bestmode = mode
				end
			end
		end
		if bestmode then
			maxscale = math.min(bestmode.width/basew, bestmode.height/baseh)
		end
	else
		local deskwidth, deskheight = love.window.getDesktopDimensions()
		maxscale = math.min(deskwidth/basew, deskheight/baseh)
	end
	maxscale = math.floor(maxscale)
	w = basew*maxscale
	h = baseh*maxscale

	flags.fullscreen = fullscreen
	flags.fullscreentype = exclusive and "exclusive" or "desktop"
	flags.usedpiscale = Config.usedpiscale
	flags.vsync = Config.vsync
	flags.resizable = Config.resizable
	flags.x = nil
	flags.y = nil
	love.window.setMode(w, h, flags)
end

setmetatable(Config, {
	__index = function(_, k)
		return config[k]
	end,
	__newindex = function(_, k, v)
		if defaults[k] == nil then
			print("W: Ignoring unknown config variable "..k)
		else
			config[k] = v
		end
	end
})

return Config
