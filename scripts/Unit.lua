local Physics = require "Physics"
local Tiled   = require "Tiled"
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

function Unit:addSprite(scene)
    local id, x, y, z = self.id, self.x, self.y, self.z
    local tile = self.tile
    if not tile then
        local tileset = self.tileset
        local tileid = self.tileid
        tileset = tileset and Tiled.tilesets[tileset]
        tile = tileset and tileid and tileset[tileid]
        self.tile = tile
    end
    if tile then
        self.sprite = scene:addAnimatedTile(id, tile, x, y, z, self.rotation, self.scalex, self.scaley)
        self.tileset = Tiled.tilesets[tile.tileset]
    end
end

function Unit:refreshBody()
    local id, x, y = self.id, self.x, self.y
    local tile = self.tile
    if tile then
        local bodyshape = self.bodyshape
        if bodyshape then
            local shapes = tile.shapes
            local shape = shapes and shapes[bodyshape]
            if shape then
                local w = shape.width or 1
                local h = shape.height or 1
                x = x + shape.x
                y = y + shape.y
                if Physics.isBody(id) then
                    Physics.setBody(id, x, y, w, h)
                else
                    Physics.addBody(id, x, y, w, h)
                end
            end
        end
    else
        local body = self.body
        if body then
            local w = self.width or 1
            local h = self.height or 1
            if Physics.isBody(id) then
                Physics.setBody(id, x, y, w, h)
            else
                Physics.addBody(id, x, y, w, h)
            end
        end
    end
end

function Unit:startDefault(scene)
    Unit.addSprite(self, scene)
    Unit.refreshBody(self)
end

return Unit