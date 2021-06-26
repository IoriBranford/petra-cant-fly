local Tiled = require "Tiled"
local Units = require "Units"
local Scene = require "Scene"
local Audio = require "Audio"
local Config = require "Config"
local PetraGameplay = {}

local scene
local background
local canvas

function PetraGameplay.loadphase()
    scene = Scene.new()
    background = {}
    PetraGameplay.loadMap("data/tropical_island.lua")

    canvas = love.graphics.newCanvas(Config.basewindowwidth, Config.basewindowheight)
    canvas:setFilter("nearest", "nearest")
end

function PetraGameplay.quitphase()
    scene = nil
    background = nil
    canvas = nil
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

    local layers = map.layers
    local bg = layers.bg
    if bg then
        for i = 1, #bg do
            local layer = bg[i]
            local layerid = 'l' .. layer.id
            local layertype = layer.type
            local x = layer.x
            local y = layer.y
            local z = layer.z
            if layertype == "tilelayer" then
                local tilebatch = layer.tilebatch
                if tilebatch then
                    local sceneobject = scene:addChunk(layerid, layer, stagewidth, stageheight, x, y, z)
                    sceneobject.dx = layer.dx
                    background[#background+1] = sceneobject
                end
            end
        end
    end

    local prefabs = layers.prefabs
    if prefabs then
        Units.addPrefabs(prefabs)
    end

    local music = map.music
    if music then
        Audio.playMusic(directory..music, 0)
    end
end

function PetraGameplay.fixedupdate()
    for i = 1, #background do
        local bg = background[i]
        local x = bg.x + bg.dx
        local w = bg.w
        if x <= -w then
            x = x + 2*w
        end
        bg.x = x
    end
end

function PetraGameplay.draw()
    local ghw = love.graphics.getWidth() / 2
    local ghh = love.graphics.getHeight() / 2
    local chw = canvas:getWidth() / 2
    local chh = canvas:getHeight() / 2

    love.graphics.setCanvas(canvas)
    scene:draw()
    love.graphics.setCanvas()

    local scale
    local portraitrotation = Config.isPortraitRotation()
    if portraitrotation then
        scale = math.min(math.floor(ghh / chw), math.floor(ghw / chh))
    else
        scale = math.min(math.floor(ghw / chw), math.floor(ghh / chh))
    end
    local rotation = math.rad(Config.rotation)
    love.graphics.push()
    love.graphics.translate(math.floor(ghw), math.floor(ghh))
    love.graphics.rotate(rotation)
    love.graphics.scale(scale)
    love.graphics.translate(-chw, -chh)
    love.graphics.draw(canvas, 0, 0, 0, 1, 1)
    -- Gui.draw()
    love.graphics.pop()
    love.graphics.printf(tostring(love.timer.getFPS()).." fps", 0, 0, love.graphics.getWidth(), "right")
    love.graphics.printf(tostring(math.floor(collectgarbage("count"))).." kb", 0, 16, love.graphics.getWidth(), "right")
end

return PetraGameplay
