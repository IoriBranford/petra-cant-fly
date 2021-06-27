local Unit = require "Unit"
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
    Unit.move(self, self.velx, self.vely, Bird.collisionFilter)
end

return Bird