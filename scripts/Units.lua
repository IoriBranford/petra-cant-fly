local Tiled = require "Tiled"
local bump = require "bump"
local Units = {}

local Unit

local nextunitid
local units
local thinkingunits
local newunitqueue
local removedunits
local scene
local unitprefabs
local world

function Units.init(scene0)
    Unit = Unit or require "Unit"
    world = bump.newWorld()
    nextunitid = 1
    units = {}
    thinkingunits = {}
    newunitqueue = {}
    removedunits = {}
    scene = scene0
    unitprefabs = {}
end

function Units.setNextId(id)
    nextunitid = id
end

function Units.clear()
    world = nil
    units = nil
    thinkingunits = nil
    newunitqueue = nil
    removedunits = nil
    scene = nil
    unitprefabs = nil
end

local function activateUnit(unit)
    local id = unit.id
    local x, y, z = unit.x, unit.y, unit.z
    local module = unit.module
    local start
    if module then
        module = require(module)
        local think = unit.think and module[unit.think]
        if type(think) == "function" then
            unit.think = think
            thinkingunits[id] = unit
        end
        start = unit.start and module[unit.start]
    end

    local tile = unit.tile
    if not tile then
        local tileset = unit.tileset
        local tileid = unit.tileid
        tile = tileset and tileid and Tiled.tilesets[tileset][tileid]
        unit.tile = tile
    end
    if tile then
        unit.sprite = scene:addAnimatedTile(id, tile, x, y, z, unit.rotation, unit.scalex, unit.scaley)
    end

    local body = unit.body
    if body then
        if tile then
            local bodyshape = unit.bodyshape
            local shapes = tile.shapes
            local shape = shapes and shapes[bodyshape]
            if shape then
                local w = shape.width or 1
                local h = shape.height or 1
                local ox = shape.x - tile.originx
                local oy = shape.y - tile.originy
                world:add(id, x+ox, y+oy, w, h)
            end
        else
            local w = unit.width or 1
            local h = unit.height or 1
            world:add(id, x, y, w, h)
        end
    end

    units[id] = unit

    if type(start) == "function" then
        start(unit)
    end

    return unit
end

function Units.add(base, id)
    if type(base) ~= "table" then
        if base and not unitprefabs[base] then
            return nil, string.format("No such prefab %s", base)
        end
        base = unitprefabs[base]
    end

    id = id or (base and base.id)
    if not id then
        id = nextunitid
        nextunitid = nextunitid + 1
    end

    if units[id] then
        return nil, string.format("Duplicate unit id %s", id)
    end

    local unit = {
        id = id,
        age = 0,
        width = 0,
        height = 0,
        x = 0,
        y = 0,
        z = 0,
        rotation = 0,

        velx = 0,
        vely = 0,
        avel = 0,

        tile = nil,
        sprite = nil,
        spritebatch = nil,
        spritebatchindex = nil,

        module = nil,
        start = nil,
        think = nil,
    }

    if base then
        for k, v in pairs(base) do
            unit[k] = v
        end
    end
    unit.id = id
    newunitqueue[#newunitqueue+1] = unit
    return unit
end

function Units.add_position(base, x, y, z)
    return Units.add_id_position(base, nil, x, y, z)
end

function Units.add_id_position(base, id, x, y, z)
    local unit, err = Units.add(base, id)
    if not unit then
        return nil, err
    end

    if x then
        unit.x = x
    end
    if y then
        unit.y = y
    end
    if z then
        unit.z = z
    end

    return unit
end

function Units.get(id)
    return units[id]
end

function Units.remove(unit)
    if type(unit) ~= "table" then
        removedunits[unit] = units[unit]
    else
        removedunits[unit.id] = unit
    end
end

function Units.activateAdded()
    local i = 1
    while i <= #newunitqueue do
        activateUnit(newunitqueue[i])
        i = i + 1
    end
    for i = #newunitqueue, 1, -1 do
        newunitqueue[i] = nil
    end
end

function Units.deleteRemoved()
    for id, unit in pairs(removedunits) do
        scene:remove(id)
        units[id] = nil
        thinkingunits[id] = nil
        removedunits[id] = nil
    end
end

function Units.think()
    for id, unit in pairs(thinkingunits) do
        local think = unit.think
        if think then
            think(unit)
        end
        unit.age = unit.age + 1
    end
end

function Units.addPrefabs(prefabs)
    for i = 1, #prefabs do
        local prefab = prefabs[i]
        prefab.id = nil
        local name = prefab.name or ""
        if name ~= "" and not unitprefabs[name] then
            unitprefabs[name] = prefab
        end
    end
end

function Units.iterate()
    return pairs(units)
end

return Units