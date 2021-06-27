local Physics = require "Physics"
local Unit = {}

function Unit:move(velx, vely, filter)
    local id = self.id
    local deltax, deltay, collisions, len
    if Physics.isBody(id) then
        deltax, deltay, collisions, len = Physics.moveBody(id, velx, vely, filter)
    else
        deltax, deltay = velx, vely
    end
    local sprite = self.sprite
    if sprite then
        sprite.x, sprite.y = sprite.x + deltax, sprite.y + deltay
    end
    self.x, self.y = self.x + deltax, self.y + deltay
    return deltax, deltay, collisions, len
end

return Unit