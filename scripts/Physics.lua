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

function Physics.moveBody(id, velx, vely, filter)
    local x, y = world:getRect(id)
    local newx, newy, cols, len = world:move(id, x+velx, y+vely, filter)
    return newx - x, newy - y, cols, len
end

function Physics.removeBody(id)
    world:remove(id)
end

function Physics.draw(viewx, viewy, vieww, viewh)
    for i, rect in pairs(world.rects) do
        love.graphics.rectangle("line", rect.x, rect.y, rect.w, rect.h)
    end
end

return Physics