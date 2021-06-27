local Units = require "Units"
local Unit = require "Unit"
local Balloon = {}

function Balloon:collisionFilter(otherid)
    return "cross"
end

function Balloon:thinkExpand()
    self.scalex = math.min(1, self.scalex + 1/64)
    self.scaley = math.min(1, self.scaley + 1/64)
    self.sprite.sx, self.sprite.sy = self.scalex, self.scaley
end

function Balloon:thinkFloat()
    local _, collisions, len
    if not self.attached then
        _, _, collisions, len = Unit.move(self, self.velx, self.vely, Balloon.collisionFilter)
    end
    if len > 0 or self.x < 0 or self.y < 0 then
        Units.remove(self)
        local popped = Units.add_position("balloon_pop", self.x, self.y)
        popped.scalex = self.scalex
        popped.scaley = self.scaley
    end
end

function Balloon:thinkPop()
    if self.age + 1 >= math.floor(self.tile.animation.duration*60) then
        Units.remove(self)
    end
end

return Balloon