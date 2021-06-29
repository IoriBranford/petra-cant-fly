local Tiled = require "Tiled"
local Unit = require "Unit"
local Units = require "Units"
local Petra = {}
Petra.__index = Petra

function Petra:start()
    self.tileset = Tiled.tilesets[self.tile.tileset]
end

function Petra:thinkTitle()
end

function Petra:startPlay(velx)
    self.velx = velx
    self.vely = -velx
    self.sprite:setTile(self.tileset.jump)
    self.think = Petra.thinkPlay
end

local function collisionFilter(id, otherid)
    return "cross"
end

function Petra:thinkPlay()
    self.vely = self.vely + self.gravity
    if self.vely < 0 then
        self.sprite:setTile(self.tileset.jump)
    else
        self.sprite:setTile(self.tileset.fly)
    end

    Unit.move(self, 0, self.vely/2, collisionFilter)
end

function Petra:thinkGameOver()
    self.sprite:setTile(self.tileset.down)
end

return Petra