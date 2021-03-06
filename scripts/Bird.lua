local Unit = require "Unit"
local Units = require "Units"
local Bird = {}

function Bird:start(scene)
    Unit.startDefault(self, scene)
    self.velx = self.velx or -2
    self.vely = self.vely or 0
end

function Bird:collisionFilter(other)
    if other == "petra" then
        return "cross"
    end
end

function Bird:think()
    local petra = Units.get("petra")
    Unit.move(self, self.velx, self.vely, Bird.collisionFilter)
    if self.x < 0 then
        Units.remove(self)
    end
end

return Bird