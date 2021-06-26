--[[
    Tile cache and map loader.

    Adds and modifies the following fields for convenience:

    map.directory                       Directory path containing the file
    map.objects                         All map objects by id
    map.tiles                           All map tiles by gid
    map.backgroundcolor                 Converted from range 0...255 to range 0.0...1.0
    map[prop]=val                       Map properties become fields of the map*

    tileset[prop]=val                   Tileset properties become fields of the tileset*

    tileset[i]                          Each tile in the tileset
    tileset[i].name                     String id for the tile, so you can access the tile with tileset[name]
                                        To set, give tile a string property "tilename"
    tileset[i].image                    Image
    tileset[i].quad                     Area of the image
    tileset[i].tileset                  Name of tileset
    tileset[i].originx                  Origin x (negative of tile offset)
    tileset[i].originy                  Origin y (negative of tile offset)
    tileset[i][prop]=val                Tile properties become fields of the tile*

    tileset[i].animation.duration       Total duration of all frames of animation, in seconds
    tileset[i].animation[i].duration    Converted from milliseconds to seconds, LOVE's standard time unit
    tileset[i].animation[i].tile        Tile within the tileset

    tileset[i].shapes                   = tileset[i].objectGroup.objects
    tileset[i].shapes[i].x              Offset by -originx
    tileset[i].shapes[i].y              Offset by -originy
    tileset[i].shapes[i][prop]=val      Shape properties become fields of the shape*
    tileset[i].shapes[name]             You can access the shape by name if it has one

    tilelayer.chunk.data                Decompressed and decoded into array of gids
    tilelayer.chunk.tilebatch           SpriteBatch of the chunk
    tilelayer.data                      Decompressed and decoded into array of gids
    tilelayer.tilebatch                 SpriteBatch of the whole layer

    map.layers[name]                    You can access the top-level layer by name if it has one
    layer.x                             = layer.offsetx
    layer.y                             = layer.offsety
    layer.z                             Drawing order, default depends on layer order, set with layer property "z" (float)
    layer[prop]=val                     Layer properties become fields of the layer*

    objectgroup[i]                      Each object in the object group
    objectgroup[name]                   You can access the object by name if it has one
    objectgroup[i].z                    Drawing order, default is objectgroup's z, set with object property "z" (float)
    objectgroup[i].tile                 Object tile from gid
    objectgroup[i].rotation             Converted from degrees to radians, LOVE's standard rotation unit
    objectgroup[i].scalex               Object scale x from gid flipx and tile width
    objectgroup[i].scaley               Object scale y from gid flipy and tile height
    objectgroup[i][prop]=val            Object properties become fields of the object*
    objectgroup[i].polygon              Converted to LOVE-style array {x1, y1, x2, y2, ...}
    objectgroup[i].polyline             Converted to LOVE-style array {x1, y1, x2, y2, ...}
    objectgroup[i].text                 Converted to LOVE Text object
                                        Font file should be in Tiled.fontpath and follow this naming:
                                        "fontfamily.ttf"
                                        "fontfamily Bold.ttf"
                                        "fontfamily Italic.ttf"
                                        "fontfamily Bold Italic.ttf"
                                        "fontfamily pixelsize.fnt"
                                        "fontfamily Bold pixelsize.fnt"
                                        "fontfamily Italic pixelsize.fnt"
                                        "fontfamily Bold Italic pixelsize.fnt"

    layergroup[i]                       Each layer in a layer group
    layergroup[name]                    You can access the in-group layer by name if it has one

    * Can't overwrite existing fields

    Unsupported:
        Diagonal flip flag
        Tileset margin and spacing
        Tile object alignment other than Top Left
        External tilesets
        Tile layer using multiple tilesets
]] --

local Tiled = {}
Tiled.fontpath = ""

function Tiled.clearCache()
    Tiled.tilesets = {}
    Tiled.images = {}
    Tiled.fonts = {}
end
Tiled.clearCache()

function Tiled.setFontPath(fontpath)
    Tiled.fontpath = fontpath
    if fontpath[-1] ~= "/" then
        fontpath = fontpath.."/"
    end
end

local function addIfNew(t, k, v)
    if t[k] then
        print(string.format("W: tried to overwrite duplicate or reserved field name %s in %s", k, t.name or t))
    else
        t[k] = v
    end
end

local function propertiesToFields(t, dest)
    local properties = t.properties
    if properties then
        dest = dest or t
        for k, v in pairs(properties) do
            addIfNew(dest, k, v)
        end
        t.properties = nil
    end
end

function Tiled.addTileset(tileset)
    -- assert(tileset.objectalignment == "topleft", "Unsupported objectalignment "..tileset.objectalignment)
    assert(not tileset.source,
        "External tilesets unsupported. Please export with 'Embed Tilesets' enabled in export options.")

    local alltilesets = Tiled.tilesets

    local tilesetname = tileset.name
    if alltilesets[tilesetname] then
        return alltilesets[tilesetname]
    end
    alltilesets[tilesetname] = tileset

    local image = Tiled.loadImage(tileset.image)
    local columns = tileset.columns
    local n = tileset.tilecount
    local tw = tileset.tilewidth
    local th = tileset.tileheight

    -- TODO To work correctly they should only apply to objects
    -- local ObjectAlignments = {
    --     topleft     = {0.0, 0.0},
    --     top         = {0.5, 0.0},
    --     topright    = {1.0, 0.0},
    --     left        = {0.0, 0.5},
    --     center      = {0.5, 0.5},
    --     right       = {1.0, 0.5},
    --     bottomleft  = {0.0, 1.0},
    --     bottom      = {0.5, 1.0},
    --     bottomright = {1.0, 1.0},
    -- }
    -- local alignment = ObjectAlignments[tileset.objectalignment] or ObjectAlignments.bottomleft
    -- local ox, oy = alignment[1]*tw, alignment[2]*th
    local ox, oy = 0, 0
    if tileset.tileoffset then
        ox = ox - tileset.tileoffset.x
        oy = oy - tileset.tileoffset.y
    end

    for i = 0, n - 1 do
        local c = i % columns
        local r = math.floor(i / columns)
        local tx = c * tw
        local ty = r * th
        local tile = {
            tileset = tilesetname,
            image = image,
            quad = love.graphics.newQuad(tx, ty, tw, th, image),
            width = tw,
            height = th,
            originx = ox,
            originy = oy
        }
        tileset[i] = tile
    end

    local tilesdata = tileset.tiles
    if not tilesdata then
        return
    end
    for i = 1, #tilesdata do
        local tiledata = tilesdata[i]
        local tileid = tiledata.id
        local tilename

        local properties = tiledata.properties
        if properties then
            tilename = properties.tilename
        end

        local animation = tiledata.animation
        if animation then
            local totalduration = 0
            for f = 1, #animation do
                local frame = animation[f]
                local duration = frame.duration
                totalduration = totalduration + duration
                frame.duration = duration / 1000
                frame.tile = tileset[frame.tileid]
            end
            animation.duration = totalduration / 1000
        end

        local shapes = tiledata.objectGroup
        if shapes then
            shapes = shapes.objects
            for i = 1, #shapes do
                local shape = shapes[i]
                shape.x = shape.x - ox
                shape.y = shape.y - oy
                local name = shape.name or ""
                if #name > 0 then
                    shapes[name] = shape
                end
                propertiesToFields(shape)
            end
        end

        local tile = tileset[tileid]
        if tilename then
            tile.id = tileid
            tile.name = tilename
            tileset[tilename] = tile
        end
        tile.animation = animation
        tile.shapes = shapes

        propertiesToFields(tiledata, tile)
    end

    propertiesToFields(tileset)
    return tileset
end

function Tiled.getAnimationUpdate(animation, i, t)
    local duration = animation[i].duration
    while t >= duration do
        t = t - duration
        i = (i >= #animation) and 1 or (i + 1)
        duration = animation[i].duration
    end
    return i, t
end

local function decodeGids(data, encoding, compression)
    local gids = {}
    if encoding == "csv" then
        for gid in data:gmatch("%d+") do
            gids[#gids + 1] = tonumber(gid)
        end
        return gids
    elseif encoding == "base64" then
        data = love.data.decode("data", encoding, data)
        if compression then
            data = love.data.decompress("data", compression, data)
        end
    end
    local ffi = require "ffi"
    local pointer = ffi.cast("uint32_t*", data:getFFIPointer())
    local n = math.floor(data:getSize() / ffi.sizeof("uint32_t"))

    for i = 0, n - 1 do
        gids[#gids + 1] = pointer[i]
    end
    return gids
end

local function parseGid(gid)
    local h, v = 1, 1
    if gid > 0x080000000 then
        h = -h
        gid = gid - 0x080000000
    end
    if gid > 0x040000000 then
        v = -v
        gid = gid - 0x040000000
    end
    return gid, h, v
end

function Tiled.newTileBatch(tiles, gids, cellwidth, cellheight, cols, rows)
    local tile
    for i = 1, #gids do
        tile = tiles[gids[i]]
        if tile then
            break
        end
    end
    if not tile then
        return
    end

    local tilebatch = love.graphics.newSpriteBatch(tile.image, cols * rows)
    local i = 1
    local y = cellheight
    for r = 1, rows do
        local x = 0
        for c = 1, cols do
            local gid, sx, sy = parseGid(gids[i])
            local tile = tiles[gid]
            if tile then
                local hw, hh = tile.width / 2, tile.height / 2
                tilebatch:add(tile.quad, x + hw - tile.originx, y - hh - tile.originy, 0, sx, sy, hw, hh)
            else
                tilebatch:add(x, y, 0, 0, 0)
            end
            i = i + 1
            x = x + cellwidth
        end
        y = y + cellheight
    end

    return tilebatch
end

function Tiled.loadImage(imagefile)
    local image = Tiled.images[imagefile] or love.graphics.newImage(imagefile)
    Tiled.images[imagefile] = image
    image:setFilter("nearest", "nearest")
    return image
end

local function setLayersZ(layers, z1, dz)
    local layer1 = layers[1]
    if layer1 then
        layer1.z = layer1.properties.z or z1
        layer1.properties.z = nil
    end
    for i = 2, #layers do
        local layer = layers[i]
        layer.z = layer.properties.z or (layers[i-1].z + dz)
        layer.properties.z = nil
    end
end

function Tiled.load(mapfile)
    local map, err = love.filesystem.load(mapfile)
    assert(map, err)
    map = map()

    local directory = string.match(mapfile, "^(.+/)") or ""
    map.directory = directory

    if map.image then
        local tileset = map
        tileset.image = directory..tileset.image
        tileset = Tiled.addTileset(tileset)
        return tileset
    end

    if map.backgroundcolor then
        for i, c in ipairs(map.backgroundcolor) do
            map.backgroundcolor[i] = (1+c) / 256
        end
    end

    local maptiles = {}
    map.tiles = maptiles
    local mapobjects = {}
    map.objects = mapobjects

    local tilesets = map.tilesets
    for i = 1, #tilesets do
        local tileset = tilesets[i]
        tileset.image = directory..tileset.image
        tileset = Tiled.addTileset(tileset)
        for t = 0, tileset.tilecount - 1 do
            maptiles[#maptiles + 1] = tileset[t]
        end
    end

    local cellwidth = map.tilewidth
    local cellheight = map.tileheight
    local cols = map.width
    local rows = map.height

    local function doLayer(layer, parent)
        local layername = layer.name
        if layername ~= "" then
            addIfNew(parent, layername, layer)
        end
        local layertype = layer.type
        layer.x = layer.offsetx
        layer.y = layer.offsety
        local z = layer.z
        if layertype == "group" then
            local grouplayers = layer.layers
            local scalez = (parent.scalez or 1) / #grouplayers
            layer.scalez = scalez
            setLayersZ(grouplayers, z, scalez)
            for i = 1, #grouplayers do
                local grouplayer = grouplayers[i]
                layer[i] = grouplayer
                doLayer(grouplayer, layer)
            end
            layer.layers = nil
        elseif layertype == "tilelayer" then
            local chunks = layer.chunks
            local encoding = layer.encoding
            local compression = layer.compression
            if chunks then
                for i = 1, #chunks do
                    local chunk = chunks[i]
                    local gids = decodeGids(chunk.data, encoding, compression)
                    chunk.data = gids
                    chunk.tilebatch = Tiled.newTileBatch(maptiles, gids, cellwidth, cellheight, chunk.width,
                                          chunk.height)
                end
            else
                local gids = decodeGids(layer.data, encoding, compression)
                layer.data = gids
                layer.tilebatch = Tiled.newTileBatch(maptiles, gids, cellwidth, cellheight, cols, rows)
            end
        elseif layertype == "objectgroup" then
            local objects = layer.objects
            for i = 1, #objects do
                local object = objects[i]
                layer[i] = object
                local objectname = object.name
                if objectname ~= "" then
                    addIfNew(layer, objectname, object)
                end
                mapobjects[object.id] = object
                local gid = object.gid
                if gid then
                    local sx, sy
                    gid, sx, sy = parseGid(gid)
                    local tile = maptiles[gid]
                    object.tile = tile
                    object.scalex = sx * object.width / tile.width
                    object.scaley = sy * object.height / tile.height
                end
                local polygon = object.polygon
                if polygon then
                    local points = {}
                    object.polygon = points
                    for i = 1, #polygon do
                        local point = polygon[i]
                        points[#points+1] = point.x
                        points[#points+1] = point.y
                    end
                end
                local polyline = object.polyline
                if polyline then
                    local points = {}
                    object.polyline = points
                    for i = 1, #polyline do
                        local point = polyline[i]
                        points[#points+1] = point.x
                        points[#points+1] = point.y
                    end
                end
                local text = object.text
                if text then
                    local fontfamily = object.fontfamily or "default"
                    local fontname = string.format("%s%s%s", fontfamily,
                        object.bold and " Bold" or "",
                        object.italic and " Italic" or "")
                    local ttf = Tiled.fontpath..fontname..".ttf"
                    local pixelsize = object.pixelsize or 16
                    fontname = string.format("%s %d", fontname, pixelsize)
                    local fnt = Tiled.fontpath..fontname..".fnt"
                    local font = Tiled.fonts[fontname]
                        or love.filesystem.getInfo(fnt) and love.graphics.newFont(fnt)
                        or love.filesystem.getInfo(ttf) and love.graphics.newFont(ttf, pixelsize)
                        or love.graphics.newFont(pixelsize)
                    if not Tiled.fonts[fontname] then
                        font:setFilter("nearest", "nearest")
                        Tiled.fonts[fontname] = font
                    end
                    object.text = love.graphics.newText(font)
                    object.text:setf(text, object.width, object.halign or "left")
                end
                object.rotation = math.rad(object.rotation)
                propertiesToFields(object)
                object.z = object.z or z
            end
            layer.objects = nil
        elseif layertype == "imagelayer" then
            layer.image = Tiled.loadImage(layer.image)
        end
        propertiesToFields(layer)
    end

    local layers = map.layers
    setLayersZ(layers, 1, 1)
    for i = 1, #layers do
        local layer = layers[i]
        doLayer(layer, layers)
    end
    propertiesToFields(map)

    return map
end

return Tiled
