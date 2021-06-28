local Tiled = require "Tiled"
local Units = require "Units"
local Scene = require "Scene"
local Audio = require "Audio"
local Config = require "Config"
local Physics = require "Physics"
local PetraGameplay = {}

local scene
local backgrounds
local currentforegrounds
local levelforegrounds
local canvas
local canvastransform
local petra
local birdprefabs
local birdinterval
local birdtimer
local expandingballoon

function PetraGameplay.loadphase()
    scene = Scene.new()
    Physics.init()
    Units.init(scene)
    backgrounds = {}
    currentforegrounds = {}
    levelforegrounds = {}
    birdprefabs = {}
    birdinterval = 120
    birdtimer = birdinterval
    PetraGameplay.loadMap("data/tropical_island.lua")

    canvas = love.graphics.newCanvas(Config.basewindowwidth, Config.basewindowheight)
    canvas:setFilter("nearest", "nearest")

    local ghw = love.graphics.getWidth() / 2
    local ghh = love.graphics.getHeight() / 2
    local chw = canvas:getWidth() / 2
    local chh = canvas:getHeight() / 2

    local scale
    local portraitrotation = Config.isPortraitRotation()
    if portraitrotation then
        scale = math.min(math.floor(ghh / chw), math.floor(ghw / chh))
    else
        scale = math.min(math.floor(ghw / chw), math.floor(ghh / chh))
    end
    local rotation = math.rad(Config.rotation)
    canvastransform = love.math.newTransform()
    canvastransform:translate(math.floor(ghw), math.floor(ghh))
    canvastransform:rotate(rotation)
    canvastransform:scale(scale)
    canvastransform:translate(-chw, -chh)
end

function PetraGameplay.quitphase()
    Physics.clear()
    Units.clear()
    scene = nil
    backgrounds = nil
    currentforegrounds = nil
    levelforegrounds = nil
    canvas = nil
    canvastransform = nil
    petra = nil
    birdprefabs = nil
    expandingballoon = nil
end

function PetraGameplay.loadMap(stagefile)
    local map = Tiled.load(stagefile)
    local directory = map.directory

    Units.setNextId(map.nextobjectid)
    local cellwidth = map.tilewidth
    local cellheight = map.tileheight
    local stagecols = map.width
    local stagerows = map.height
    local stagewidth = stagecols * cellwidth
    local stageheight = stagerows * cellheight

    local function addLayersToScene(layers, sceneobjects)
        for i = 1, #layers do
            local layer = layers[i]
            local layerid = 'l' .. layer.id
            local layertype = layer.type
            local x = layer.x
            local y = layer.y
            local z = layer.z
            if layertype == "tilelayer" then
                local tilebatch = layer.tilebatch
                if tilebatch then
                    local sceneobject = scene:addChunk(layerid, layer, stagewidth, stageheight, x, y, z)
                    sceneobject.showonce = layer.showonce
                    sceneobject.parallax_x = layer.parallax_x
                    sceneobject.parallax_y = layer.parallax_y
                    if sceneobjects then
                        sceneobjects[#sceneobjects+1] = sceneobject
                    end
                end
            end
        end
    end

    local layers = map.layers
    addLayersToScene(layers, currentforegrounds)
    addLayersToScene(layers.level1, levelforegrounds)
    currentforegrounds[#currentforegrounds+1] = table.remove(levelforegrounds, 1)
    addLayersToScene(layers.bg, backgrounds)
    birdprefabs = layers.birds
    Units.addPrefabs(birdprefabs)
    Units.addPrefabs(layers.tools)
    local startobjects = layers.startobjects
    petra = Units.add(startobjects.petra, "petra")
    Units.activateAdded()

    local music = map.music
    if music then
        Audio.playMusic(directory..music, 0)
    end
end

local function fixedupdate_title()
end

local function fixedupdate_play()
    Units.think()
    local canvasw = canvas:getWidth()
    local canvash = canvas:getHeight()
    local petravelx, petravely = petra.velx, petra.vely/2
    for i = 1, #backgrounds do
        local background = backgrounds[i]
        local parallax_x = background.parallax_x
        local parallax_y = background.parallax_y
        local x = background.x - parallax_x*petravelx
        local y = background.y - parallax_y*petravely
        local w = background.w
        local h = background.h
        local miny = canvash - h
        if x <= -w then
            x = x + 2*w
        end
        if y > 0 then
            y = 0
        elseif y < miny then
            y = miny
        end
        background.x = x
        background.y = y
    end
    for i = 1, #currentforegrounds do
        local foreground = currentforegrounds[i]
        local x = foreground.x - petravelx
        local y = foreground.y - petravely
        local w = foreground.w
        local h = foreground.h
        local miny = canvash - h
        if y > 0 then
            y = 0
        elseif y < miny then
            y = miny
        end
        foreground.x = x
        foreground.y = y
    end
    local fg1, fg2 = currentforegrounds[1], currentforegrounds[2]
    if fg1.x + fg1.w <= 0 then
        if not fg1.showonce then
            levelforegrounds[#levelforegrounds+1] = fg1
        end
        fg1 = fg2
        fg2 = table.remove(levelforegrounds, love.math.random(#levelforegrounds))
        fg2.x = fg1.x + fg1.w
        fg2.y = fg1.y
        currentforegrounds[1] = fg1
        currentforegrounds[2] = fg2
    end
    birdtimer = birdtimer - 1
    if birdtimer <= 0 then
        birdtimer = birdinterval
        local birdprefab = birdprefabs[love.math.random(#birdprefabs)]
        Units.add_position(birdprefab, canvasw, canvash/2)
    end
    Units.activateAdded()
    Units.deleteRemoved()
end

local function fixedupdate_gameover()
end

local function startPlay()
    love.fixedupdate = fixedupdate_play
    petra:startPlay(3)
end

PetraGameplay.fixedupdate = fixedupdate_title

function PetraGameplay.mousepressed(x, y, button, istouch, presses)
    if love.fixedupdate == fixedupdate_title then
        startPlay()
    elseif love.fixedupdate == fixedupdate_gameover then
        love.event.loadphase("PetraGameplay")
    elseif not expandingballoon then
        x, y = canvastransform:inverseTransformPoint(x, y)
        x = math.max(0, math.min(x, canvas:getWidth()))
        y = canvas:getHeight()
        expandingballoon = Units.add_position("balloon_expand", x, y)
    end
end

function PetraGameplay.mousemoved(x, y, dx, dy, istouch)
    if expandingballoon then
        x, y = canvastransform:inverseTransformPoint(x, y)
        x = math.max(0, math.min(x, canvas:getWidth()))
        expandingballoon.x = x
        if expandingballoon.sprite then
            expandingballoon.sprite.x = x
        end
    end
end

function PetraGameplay:mousereleased(x, y, button, istouch, presses)
    if expandingballoon then
        local balloon = Units.add_position("balloon_float", expandingballoon.x, expandingballoon.y)
        balloon.scalex = expandingballoon.scalex
        balloon.scaley = expandingballoon.scaley
        balloon.velx = -petra.velx
        balloon.vely = balloon.vely * balloon.scaley
        Units.remove(expandingballoon)
        expandingballoon = nil
    end
end

function PetraGameplay.update(dsecs)
    scene:updateAnimations(dsecs)
end

function PetraGameplay.draw()
    love.graphics.setCanvas(canvas)
    love.graphics.clear()
    scene:draw()
    -- Physics.draw()
    love.graphics.setCanvas()

    love.graphics.push()
    love.graphics.applyTransform(canvastransform)
    love.graphics.draw(canvas, 0, 0, 0, 1, 1)
    -- Gui.draw()
    love.graphics.pop()
    love.graphics.printf(tostring(love.timer.getFPS()).." fps", 0, 0, love.graphics.getWidth(), "right")
    love.graphics.printf(tostring(math.floor(collectgarbage("count"))).." kb", 0, 16, love.graphics.getWidth(), "right")
end

return PetraGameplay
