local Units = require "Units"
local Unit = require "Unit"
local Physics = require "Physics"
local Audio = require "Audio"
local Balloon = {}
Balloon.metatable = {
    __index = Balloon
}

local function collisionFilter(id, otherid)
    return "cross"
end

local function draw(sceneobject)
    local stringlength = sceneobject.stringlength
    if stringlength then
        local numsegments = 4
        local segmentlength = stringlength/numsegments
        local x, y, r = sceneobject.x, sceneobject.y, sceneobject.r
        local cos = -math.cos(r)
        local sin = -math.sin(r)
        for i = 1, numsegments do
            local dx = cos*segmentlength + love.math.random()*2 - 1
            local dy = sin*segmentlength + love.math.random()*2 - 1
            love.graphics.line(x, y, x+dx, y+dy)
            x = x + dx
            y = y + dy
        end
    end
    sceneobject:drawQuad()
end

function Balloon:start(scene)
    Unit.startDefault(self, scene)
    self.sprite.draw = draw
    self.sprite.stringlength = self.stringlength
end

function Balloon:thinkExpand()
    self.scalex = math.min(1, self.scalex + 1/64)
    self.scaley = math.min(1, self.scaley + 1/64)
    self.sprite.sx, self.sprite.sy = self.scalex, self.scaley
end

function Balloon:thinkFloat()
    local petra = Units.get("petra")
    local petraid = petra.id
    if self.attached then
        self.rotation = math.atan2(-petra.vely, -petra.velx) - math.sin(self.age*math.pi/4)*math.pi/self.stringlength/2
        self.velx = petra.x + math.cos(self.rotation) * self.stringlength - self.x
        self.vely = petra.y + math.sin(self.rotation) * self.stringlength - self.y
        self.sprite.r = self.rotation
    end
    local _, _, collisions, len = Unit.move(self, self.velx, self.vely, collisionFilter)
    local popped = self.x < 0 or self.y < 0
    for i = 1, #collisions do
        local otherid = collisions[i].other
        if otherid == petraid then
            if not self.attached then
                petra.vely = self.vely
                local newgravity = petra.gravity - self.scaley/32
                if newgravity > 0 then
                    self.attached = true
                    petra.gravity = newgravity
                    Audio.play("data/audio/attach.wav")
                else
                    popped = true
                end
            end
        else
            local other = Units.get(otherid)
            if not other or other.module ~= "Balloon" then
                popped = true
            end
        end
    end
    if popped then
        self:pop()
    end
end

function Balloon:pop()
    local petra = Units.get("petra")
    if self.attached then
        petra.gravity = petra.gravity + self.scaley/32
    end
    Units.remove(self)
    local pop = Units.add_position("balloon_pop", self.x, self.y)
    pop.scalex = self.scalex
    pop.scaley = self.scaley
    Audio.play("data/audio/pop.wav")
end

function Balloon:thinkPop()
    if self.age + 1 >= math.floor(self.tile.animation.duration) then
        Units.remove(self)
    end
end

return Balloon