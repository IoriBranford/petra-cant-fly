local Physics = require "Physics"
local Unit = require "Unit"
local startDefault = Unit.startDefault
local type = type
local require = require
local Units = {}

local nextunitid
local unitsbyid
local unitsbystringid
local thinkingunits
local thinkingunitsarray
local newunitqueue
local removedunits
local scene
local unitprefabs

function Units.init(scene0)
    nextunitid = 1
    unitsbyid = {}
    unitsbystringid = {}
    thinkingunits = {}
    thinkingunitsarray = {}
    newunitqueue = {}
    removedunits = {}
    scene = scene0
    unitprefabs = {}
end

function Units.setNextId(id)
    nextunitid = id
end

function Units.clear()
    unitsbyid = nil
    unitsbystringid = nil
    thinkingunits = nil
    thinkingunitsarray = nil
    newunitqueue = nil
    removedunits = nil
    scene = nil
    unitprefabs = nil
end

local function activateUnit(unit)
    local id = unit.id
    unitsbyid[id] = unit
    local stringid = unit.stringid
    if stringid then
        unitsbystringid[stringid] = unit
    end

    local module = unit.module
    local start = unit.start
    local think = unit.think
    local finish = unit.finish

    if type(module) == "string" then
        module = require(module)
    end

    if type(module) == "table" then
        local metatable = module.metatable
        if metatable then
            setmetatable(unit, metatable)
        end
        if type(start) == "string" then
            start = module[start]
        end
        if type(finish) == "string" then
            finish = module[finish]
        end
        if type(think) == "string" then
            think = module[think]
        end
    end

    if type(think) == "function" then
        unit.think = think
        unit.thinkorder = unit.thinkorder or id
        thinkingunits[id] = unit
    end

    if type(finish) == "function" then
        unit.finish = finish
    end

    if type(start) == "function" then
        start(unit, scene)
    else
        startDefault(unit, scene)
    end

    return unit
end

function Units.add(base, id, stringid)
    if type(base) ~= "table" then
        if base and not unitprefabs[base] then
            return nil, string.format("No such prefab %s", base)
        end
        base = unitprefabs[base]
    end

    stringid = stringid or (base and base.stringid)
    if stringid then
        if unitsbystringid[stringid] then
            return nil, string.format("Duplicate unit string id %s", stringid)
        end
    end

    id = id or (base and base.id)
    if not id then
        id = nextunitid
        nextunitid = nextunitid + 1
    end

    if unitsbyid[id] then
        return nil, string.format("Duplicate unit id %s", id)
    end

    local unit = {
        id = id,
        stringid = stringid,
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
    unit.stringid = stringid
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
    if type(id) == "string" then
        return unitsbystringid[id]
    end
    return unitsbyid[id]
end

function Units.remove(unit)
    if type(unit) ~= "table" then
        removedunits[unit] = unitsbyid[unit]
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
        if Physics.isBody(id) then
            Physics.removeBody(id)
        end
        local stringid = unit.stringid
        if stringid then
            unitsbystringid[stringid] = nil
        end
        unitsbyid[id] = nil
        thinkingunits[id] = nil
        removedunits[id] = nil
    end
end

local function sortThinkingUnits(a, b)
    local ordera, orderb = a.thinkorder, b.thinkorder
    return ordera < orderb or ordera == orderb and a.id < b.id
end

function Units.think()
    local n = 0
    for id, unit in pairs(thinkingunits) do
        n = n + 1
        thinkingunitsarray[n] = unit
    end
    for i = #thinkingunitsarray, n+1, -1 do
        thinkingunitsarray[i] = nil
    end
    table.sort(thinkingunitsarray, sortThinkingUnits)
    for i = 1, n do
        local unit = thinkingunitsarray[i]
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
    return pairs(unitsbyid)
end

return Units