local bump = require "bump"
local Physics = {}

local world

function Physics.init()
    world = bump.newWorld()
end

function Physics.clear()
    world = nil
end

function Physics.addBody(id, x, y, w, h)
    world:add(id, x, y, w, h)
end

function Physics.isBody(id)
    return world:hasItem(id)
end

function Physics.getBody(id)
    return world:getRect(id)
end

function Physics.setBody(id, x, y, w, h)
    local x0, y0, w0, h0 = world:getRect(id)
    world:update(id, x or x0, y or y0, w or w0, h or h0)
end

function Physics.moveBody(id, newx, newy, filter)
    return world:move(id, newx, newy, filter)
end

function Physics.removeBody(id)
    world:remove(id)
end

local function drawFixture(fixture)
    local shape = fixture:getShape()
    local typ = shape:getType()
    if typ == "circle" then
        local body = fixture:getBody()
        local x, y = body:getWorldPoint(shape:getPoint())
        love.graphics.circle("line", x, y, shape:getRadius())
    elseif typ == "polygon" or typ == "chain" then
        local body = fixture:getBody()
        love.graphics.polygon("line", body:getWorldPoints(shape:getPoints()))
    end
    return true
end

function Physics.draw(viewx, viewy, vieww, viewh)
end

return Physics