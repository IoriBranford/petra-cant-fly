local Physics = require "Physics"
local Bird = {}

function Bird:start()
    self.velx = self.velx or -2
    self.vely = self.vely or 0
end

function Bird:collisionFilter(other)
    if other == "petra" then
        return "cross"
    end
end

function Bird:think()
    local id = self.id
    local velx, vely = self.velx, self.vely
    local deltax, deltay, collisions, len = Physics.moveBody(id, velx, vely, Bird.collisionFilter)
    local sprite = self.sprite
    sprite.x, sprite.y = sprite.x + deltax, sprite.y + deltay
end

return Bird